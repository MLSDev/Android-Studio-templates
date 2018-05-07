package ${packageName}.${packName};

<#if applicationPackage??>import ${applicationPackage}.ui.base.BaseViewModel;</#if>

public class ${Name}ViewModel extends BaseViewModel<${Name}Fragment> {

  public ${Name}ViewModel(${Name}Fragment fragment) {
          super(fragment);
  }

}
