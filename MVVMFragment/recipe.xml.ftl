<?xml version="1.0"?>
<recipe>

    <instantiate from="res/layout/fragment_blank.xml.ftl"
                    to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />

    <instantiate from="src/app_package/BlankViewModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${packName}/${Name}ViewModel.java" />

    <instantiate from="src/app_package/BlankFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${packName}/${className}.java" />

    <open file="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />

   	<open file="${escapeXmlAttribute(srcOut)}/${Name}ViewModel.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${className}.java" />


</recipe>
