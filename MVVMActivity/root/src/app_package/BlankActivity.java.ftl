package ${packageName}.${packName};

import android.content.Context;
import android.content.Intent;
<#if applicationPackage??>import ${applicationPackage}.R;</#if>
<#if applicationPackage??>import ${applicationPackage}.ui.base.BaseActivity;</#if>

public class ${className} extends BaseActivity<Activity${Name}Binding, ${Name}ViewModel> {

  public static void start(Context context) {
    context.startActivity(new Intent(context, ${className}.class));
  }

  @Override
  public ${Name}ViewModel getViewModel() {
      return new ${Name}ViewModel(this);
  }

  @Override protected int getLayoutId() {
      return R.layout.${activityName};
  }

}
