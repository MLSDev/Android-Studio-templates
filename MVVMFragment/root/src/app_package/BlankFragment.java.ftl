package ${packageName}.${packName};

import android.content.Context;
import android.content.Intent;
<#if applicationPackage??>import ${applicationPackage}.R;</#if>
<#if applicationPackage??>import ${applicationPackage}.ui.base.BaseBindingFragment;</#if>

public class ${className} extends BaseBindingFragment<Fragment${Name}Binding, ${Name}ViewModel>  {

  public static ${className} newInstance() {
    return new ${className}();
  }

  @Override protected int getLayoutId() {
    return R.layout.${fragmentName};
  }

}
