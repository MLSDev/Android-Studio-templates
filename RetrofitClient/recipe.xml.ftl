<?xml version="1.0"?>
<recipe>

    <#if !(hasDependency('com.squareup.retrofit2:retrofit'))>
        <dependency mavenUrl="com.squareup.retrofit2:retrofit:2.3.0"/>
    </#if>

    <#if !(hasDependency('com.squareup.retrofit2:converter-gson'))>
        <dependency mavenUrl="com.squareup.retrofit2:converter-gson:2.3.0"/>
    </#if>

    <#if !(hasDependency('com.squareup.okhttp3:logging-interceptor'))>
        <dependency mavenUrl="com.squareup.okhttp3:logging-interceptor:3.9.0"/>
    </#if>

    <instantiate from="src/app_package/Callback.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${packName}/Callback.java" />

    <instantiate from="src/app_package/DataRepository.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${packName}/DataRepository.java" />

    <instantiate from="src/app_package/TestService.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${packName}/${className}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${className}.java" />


</recipe>
