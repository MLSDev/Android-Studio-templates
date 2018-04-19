package ${packageName}.${packName};

<#if applicationPackage??>import ${applicationPackage}.ui.base.BaseViewModel;</#if>

public class ${Name}ViewModel extends BaseViewModel<${Name}Activity> {

  public ${Name}ViewModel(${Name}Activity activity) {
          super(activity);
  }

}
