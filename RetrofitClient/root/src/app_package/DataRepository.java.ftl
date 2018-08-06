package ${packageName}.${packName};

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import okhttp3.Cache;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class DataRepository {

    private static int CONNECT_TIMEOUT_MILLIS = 15000;
    private static int READ_TIMEOUT_MILLIS = 15000;
    private static int RETRY_COUNT = 3;

    private final OkHttpClient client;

    public final ${className} ${className};

    public void clearData() {
            try {
                client.cache().evictAll();
            } catch (IOException e) {
                Logger.e(e.toString());
            }
    }

    private ApiClient() {
        client = createHttpClient(false);
        ${className} = createRestAdapterForEndPoint(client, ${className}.BASE_URL).create(${className}.class);
    }

    private Retrofit createRestAdapterForEndPoint(OkHttpClient client, String endPoint) {
        return new Retrofit.Builder()
                .baseUrl(endPoint)
                .client(client)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    private OkHttpClient createHttpClient(boolean cacheEnabled) {
        HttpLoggingInterceptor logging = new HttpLoggingInterceptor();
        logging.setLevel(HttpLoggingInterceptor.Level.BODY);
        return new OkHttpClient.Builder()
                .connectTimeout(CONNECT_TIMEOUT_MILLIS, TimeUnit.MILLISECONDS)
                .readTimeout(READ_TIMEOUT_MILLIS, TimeUnit.MILLISECONDS)
                .cache(cacheEnabled ? new Cache(AppConfiguration.getHttpCacheDirectory(), 10 * 1024 * 1024) : null)
                .addInterceptor(chain -> {
                    Request request = chain.request();
                    Response response = chain.proceed(request);
                    int tryCount = 0;
                    while (!response.isSuccessful() && tryCount < RETRY_COUNT) {
                        tryCount++;
                        response = chain.proceed(request);
                    }
                    return response;
                })
                .addInterceptor(logging)
                .addNetworkInterceptor(chain -> {
                    Response originalResponse = chain.proceed(chain.request());
                    return originalResponse.newBuilder()
                            .header("Cache-Control", "max-age=86400, only-if-cached, max-stale=0")
                            .build();
                })
                .build();
    }

}
