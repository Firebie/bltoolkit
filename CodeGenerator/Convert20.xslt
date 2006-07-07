<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

	<!-- parameters passed in by the TransformCodeGenerator -->
	<xsl:param name="generator"></xsl:param>
	<xsl:param name="version"></xsl:param>
	<xsl:param name="filename"></xsl:param>
	<xsl:param name="date-created"></xsl:param>
	<xsl:param name="created-by"></xsl:param>
	<xsl:param name="namespace"></xsl:param>
	<xsl:param name="output"></xsl:param>

	<!-- support variables -->
	<xsl:variable name="lf">&#13;</xsl:variable>
	<xsl:variable name="t1">&#9;</xsl:variable>
	<xsl:variable name="t2">&#9;&#9;</xsl:variable>
	<xsl:variable name="t3">&#9;&#9;&#9;</xsl:variable>
	<xsl:variable name="t4">&#9;&#9;&#9;&#9;</xsl:variable>
	<xsl:variable name="t5">&#9;&#9;&#9;&#9;&#9;</xsl:variable>
	<xsl:variable name="t6">&#9;&#9;&#9;&#9;&#9;&#9;</xsl:variable>
	<xsl:variable name="t7">&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:variable>
	<xsl:variable name="t8">&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:variable>
	<xsl:variable name="s1">&#32;</xsl:variable>
	<xsl:variable name="s2">&#32;&#32;</xsl:variable>
	<xsl:variable name="s3">&#32;&#32;&#32;</xsl:variable>
	<xsl:variable name="s4">&#32;&#32;&#32;&#32;</xsl:variable>
	<xsl:variable name="s5">&#32;&#32;&#32;&#32;&#32;</xsl:variable>
	<xsl:variable name="s6">&#32;&#32;&#32;&#32;&#32;&#32;</xsl:variable>
	<xsl:variable name="s7">&#32;&#32;&#32;&#32;&#32;&#32;&#32;</xsl:variable>
	<xsl:variable name="s8">&#32;&#32;&#32;&#32;&#32;&#32;&#32;&#32;</xsl:variable>

	<!-- customization -->
	<xsl:variable name="cls">Convert</xsl:variable>
	<xsl:variable name="padding">11</xsl:variable>

	<!-- the root of all evil -->
	<xsl:template match="/">
		<!--<xsl:call-template name="header-comment"/>-->
		<xsl:apply-templates select="code"/>
	</xsl:template>

	<xsl:template name="header-comment">
		<xsl:value-of select="$lf"/>
		<xsl:text>#region Generated File</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:text>/*</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:text> * GENERATED FILE -- DO NOT EDIT</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:text> *</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:text> * Generator: </xsl:text>
		<xsl:value-of select="$generator"/>
		<xsl:value-of select="$lf"/>
		<xsl:text> * Version:   </xsl:text>
		<xsl:value-of select="$version"/>
		<xsl:value-of select="$lf"/>
		<xsl:text> *</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:text> *</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:text> * Generated code from "</xsl:text>
		<xsl:value-of select="$filename"/>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:text> *</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:text> * Created: </xsl:text>
		<xsl:value-of select="$date-created"/>
		<xsl:value-of select="$lf"/>
		<xsl:text> * By:      </xsl:text>
		<xsl:value-of select="$created-by"/>
		<xsl:value-of select="$lf"/>
		<xsl:text> *</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:text> */</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:text>#endregion</xsl:text>
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<xsl:template match="code">
		<xsl:apply-templates select="using"/>
		<xsl:value-of select="$lf"/>
		<xsl:text>namespace </xsl:text>
		<xsl:value-of select="$namespace"/>
		<xsl:value-of select="$lf"/>
		<xsl:text>{</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:call-template name="class"/>
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<xsl:template match="using">
		<xsl:text>using </xsl:text>
		<xsl:value-of select="@namespace"/>
		<xsl:text>;</xsl:text>
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<!-- the class definition -->
	<xsl:template name="class">
		<xsl:value-of select="$t1"/>
		<xsl:text>public static class </xsl:text>
		<xsl:value-of select="$cls"/>
		<xsl:text>&lt;T,P&gt;</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t1"/>
		<xsl:text>{</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>public delegate T ConvertMethod(P p);</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>public static readonly ConvertMethod From = GetConverter();</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>public static ConvertMethod GetConverter()</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>{</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>Type t = typeof(T);</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>// Convert to the same type.</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>//</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>if (t.IsAssignableFrom(typeof(P)))</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t4"/>
		<xsl:text>return (ConvertMethod)(object)(</xsl:text>
		<xsl:value-of select="$cls"/>
		<xsl:text>&lt;P,P&gt;.ConvertMethod)(delegate(P p) { return p; });</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:apply-templates select="converter|comment" mode="def"/>
		<xsl:apply-templates select="region" mode="def"/>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>return delegate(P o) { return (T)Convert.ChangeType(o, typeof(T)); };</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
		<xsl:apply-templates select="converter" mode="body"/>
		<xsl:apply-templates select="region" mode="body"/>
		<xsl:value-of select="$t1"/>
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t1"/>
		<xsl:text>public static class </xsl:text>
		<xsl:value-of select="$cls"/>
		<xsl:text>To&lt;T&gt;</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t1"/>
		<xsl:text>{</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>public static T From&lt;P&gt;(P p)</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>{</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>return </xsl:text>
		<xsl:value-of select="$cls"/>
		<xsl:text>&lt;T,P&gt;.From(p);</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t1"/>
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<!-- region (method declarations) -->
	<xsl:template match="region" mode="def">
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>// </xsl:text>
		<xsl:value-of select="@name"/>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>//</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:apply-templates select="converter|comment|br" mode="def"/>
		<xsl:apply-templates select="region" mode="def"/>
	</xsl:template>

	<!-- region (method bodies) -->
	<xsl:template match="region" mode="body">
		<xsl:value-of select="$t2"/>
		<xsl:text>#region </xsl:text>
		<xsl:value-of select="@name"/>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
		<xsl:apply-templates select="converter|comment" mode="body"/>
		<xsl:apply-templates select="region" mode="body"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>#endregion</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<!-- declarations -->
	<xsl:template name="def">
		<xsl:param name="nullable"/>
		<xsl:variable name="typepad" select="$padding - string-length(@type)"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>if (t == typeof(</xsl:text>
		<xsl:value-of select="@type"/>
		<xsl:if test="$nullable">
			<xsl:text>?</xsl:text>
		</xsl:if>
		<xsl:text>))</xsl:text>
		<xsl:if test="not($nullable)">
			<xsl:value-of select="$s1"/>
		</xsl:if>
		<xsl:call-template name ="writeSpaces">
			<xsl:with-param name="count" select="$typepad"/>
		</xsl:call-template>
		<xsl:text>return Get</xsl:text>
		<xsl:if test="$nullable">
			<xsl:text>Nullable</xsl:text>
		</xsl:if>
		<xsl:value-of select="@type"/>
		<xsl:text>Converter();</xsl:text>
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<xsl:template match="converter" mode="def">
		<xsl:call-template name="def">
			<xsl:with-param name="nullable" select="@nullable='true'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- bodies -->
	<xsl:template name="body">
		<xsl:param name="nullable"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>#region </xsl:text>
		<xsl:value-of select="@type"/>
		<xsl:if test="$nullable">
			<xsl:text>?</xsl:text>
		</xsl:if>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>private static ConvertMethod Get</xsl:text>
		<xsl:if test="$nullable">
			<xsl:text>Nullable</xsl:text>
		</xsl:if>
		<xsl:value-of select="@type"/>
		<xsl:text>Converter()</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>{</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>Type t = typeof(P);</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
		<xsl:apply-templates select="group|from|comment|br">
			<xsl:with-param name="totype" select="@type"/>
			<xsl:with-param name="nullable" select="$nullable"/>
			<xsl:with-param name="default" select="default/text()"/>
		</xsl:apply-templates>
		<xsl:value-of select="$t3"/>
		<xsl:text>if (t == typeof(object))      return (ConvertMethod)(object)(</xsl:text>
		<xsl:value-of select="$cls"/>
		<xsl:text>&lt;</xsl:text>
		<xsl:value-of select="@type"/>
		<xsl:if test="$nullable">
			<xsl:text>?</xsl:text>
		</xsl:if>
		<xsl:text>,object&gt;.ConvertMethod)     (delegate(object      p)</xsl:text>
		<xsl:call-template name="writeCode">
			<xsl:with-param name="code">
				<xsl:apply-templates select="default"/>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:text>);</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>return (ConvertMethod)(object)(</xsl:text>
		<xsl:value-of select="$cls"/>
		<xsl:text>&lt;</xsl:text>
		<xsl:value-of select="@type"/>
		<xsl:if test="$nullable">
			<xsl:text>?</xsl:text>
		</xsl:if>
		<xsl:text>,T&gt;.ConvertMethod)     (delegate(T p) { return Convert&lt;</xsl:text>
		<xsl:value-of select="@type"/>
		<xsl:if test="$nullable">
			<xsl:text>?</xsl:text>
		</xsl:if>
		<xsl:text>,object&gt;.From((object)p); });</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$t2"/>
		<xsl:text>#endregion</xsl:text>
		<xsl:value-of select="$lf"/>
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<xsl:template match="converter" mode="body">
		<xsl:call-template name="body">
			<xsl:with-param name="nullable" select="@nullable='true'"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="include">
		<xsl:param name="totype"/>
		<xsl:param name="nullable"/>
		<xsl:param name="default"/>
		<xsl:param name="group"/>
		<xsl:variable name="template" select="@template"/>
		<xsl:variable name="totypefull">
			<xsl:value-of select="$totype"/>
			<xsl:if test="$nullable">
				<xsl:text>?</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:for-each select="/code/template[@name=$template]/*">
			<xsl:choose>
				<xsl:when test="name()='type'">
					<xsl:variable name ="tname" select="@name"/>
					<xsl:if test="not($tname=$totypefull) and not($group/from[@type=$tname])">
						<xsl:call-template name="from">
							<xsl:with-param name="fromtype" select="$tname"/>
							<xsl:with-param name="totype"   select="$totype"/>
							<xsl:with-param name="nullable" select="$nullable"/>
							<xsl:with-param name="code"     select="$default"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="name()='br'">
					<xsl:value-of select="$lf"/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<!-- group -->
	<xsl:template match="group">
		<xsl:param name="totype"/>
		<xsl:param name="nullable"/>
		<xsl:param name="default"/>
		<xsl:variable name="name" select="@name"/>
		<xsl:variable name="defaultcode">
			<xsl:choose>
				<xsl:when test="default/text()">
					<xsl:value-of select="default/text()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$default"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="@name">
			<xsl:value-of select="$t3"/>
			<xsl:text>// </xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:value-of select="$lf"/>
			<xsl:value-of select="$t3"/>
			<xsl:text>//</xsl:text>
		</xsl:if>
		<xsl:value-of select="$lf"/>
		<xsl:apply-templates select="group|from|comment|br|include">
			<xsl:with-param name="totype"   select="$totype"/>
			<xsl:with-param name="nullable" select="$nullable"/>
			<xsl:with-param name="default"  select="$defaultcode"/>
			<xsl:with-param name="group"    select="."/>
		</xsl:apply-templates>
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<!-- from -->
	<xsl:template match="from">
		<xsl:param name="totype"/>
		<xsl:param name="nullable"/>
		<xsl:param name="default"/>
		<xsl:call-template name="from">
			<xsl:with-param name="fromtype" select="@type"/>
			<xsl:with-param name="totype"   select="$totype"/>
			<xsl:with-param name="nullable" select="$nullable"/>
			<xsl:with-param name="code">
				<xsl:choose>
					<xsl:when test="text()">
						<xsl:value-of select="text()"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$default"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- from -->
	<xsl:template name="from">
		<xsl:param name="fromtype"/>
		<xsl:param name="totype"/>
		<xsl:param name="nullable"/>
		<xsl:param name="code"/>
		<xsl:variable name="typepad" select="$padding - string-length($fromtype)"/>
		<xsl:value-of select="$t3"/>
		<xsl:text>if (t == typeof(</xsl:text>
		<xsl:value-of select="$fromtype"/>
		<xsl:text>)) </xsl:text>
		<xsl:call-template name ="writeSpaces">
			<xsl:with-param name="count" select="$typepad"/>
		</xsl:call-template>
		<xsl:text>return (ConvertMethod)(object)(</xsl:text>
		<xsl:value-of select="$cls"/>
		<xsl:text>&lt;</xsl:text>
		<xsl:value-of select="$totype"/>
		<xsl:if test="$nullable">
			<xsl:text>?</xsl:text>
		</xsl:if>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="$fromtype"/>
		<xsl:text>&gt;.ConvertMethod)</xsl:text>
		<xsl:call-template name ="writeSpaces">
			<xsl:with-param name="count" select="$typepad"/>
		</xsl:call-template>
		<xsl:text>(delegate(</xsl:text>
		<xsl:value-of select="$fromtype"/>
		<xsl:call-template name ="writeSpaces">
			<xsl:with-param name="count" select="$typepad"/>
		</xsl:call-template>
		<xsl:text> p)</xsl:text>
		<xsl:call-template name="writeCode">
			<xsl:with-param name="code" select="$code"/>
		</xsl:call-template>
		<xsl:text>);</xsl:text>
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<xsl:template match="from" mode="runtime">
		<xsl:param name="totype"/>
		<xsl:param name="nullable"/>
		<xsl:param name="default"/>
		<xsl:if test="text() or $default">
			<xsl:variable name="typepad" select="$padding - string-length(@type)"/>
			<xsl:value-of select="$t4"/>
			<xsl:text>if (p is </xsl:text>
			<xsl:value-of select="@type"/>
			<xsl:text>) </xsl:text>
			<xsl:call-template name ="writeSpaces">
				<xsl:with-param name="count" select="$typepad"/>
			</xsl:call-template>
			<xsl:text>return </xsl:text>
			<xsl:value-of select="$cls"/>
			<xsl:text>&lt;</xsl:text>
			<xsl:value-of select="$totype"/>
			<xsl:if test="$nullable">
				<xsl:text>?</xsl:text>
			</xsl:if>
			<xsl:text>,</xsl:text>
			<xsl:value-of select="@type"/>
			<xsl:text>&gt;</xsl:text>
			<xsl:call-template name ="writeSpaces">
				<xsl:with-param name="count" select="$typepad"/>
			</xsl:call-template>
			<xsl:text>.From((</xsl:text>
			<xsl:value-of select="@type"/>
			<xsl:text>)p);</xsl:text>
			<xsl:value-of select="$lf"/>
		</xsl:if>
	</xsl:template>

	<!-- group -->
	<xsl:template match="group" mode="runtime">
		<xsl:param name="totype"/>
		<xsl:param name="nullable"/>
		<xsl:param name="default"/>
		<xsl:variable name="defaultcode">
			<xsl:choose>
				<xsl:when test="default/text()">
					<xsl:value-of select="default/text()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$default"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="@name">
			<xsl:value-of select="$lf"/>
			<xsl:value-of select="$t4"/>
			<xsl:text>// </xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:value-of select="$lf"/>
			<xsl:value-of select="$t4"/>
			<xsl:text>//</xsl:text>
		</xsl:if>
		<xsl:value-of select="$lf"/>
		<xsl:apply-templates select="group|from|br" mode ="runtime">
			<xsl:with-param name="totype" select="$totype"/>
			<xsl:with-param name="nullable" select="$nullable"/>
			<xsl:with-param name="default" select="$defaultcode"/>
		</xsl:apply-templates>
	</xsl:template>

	<!-- default -->
	<xsl:template match="default">
		<xsl:if test="@nullvalue">
			<xsl:value-of select="$lf"/>
			<xsl:value-of select="$t4"/>
			<xsl:text>if (p == null)</xsl:text>
			<xsl:value-of select="$lf"/>
			<xsl:value-of select="$t5"/>
			<xsl:text>return </xsl:text>
			<xsl:value-of select="@nullvalue"/>
			<xsl:text>;</xsl:text>
			<xsl:value-of select="$lf"/>
		</xsl:if>
		<xsl:if test="not(@noruntime) and @nullvalue">
			<xsl:apply-templates select="../from|../group|../br" mode="runtime">
				<xsl:with-param name="totype" select="../@type"/>
				<xsl:with-param name="nullable" select="../@nullable='true'"/>
			</xsl:apply-templates>
		</xsl:if>
		<xsl:value-of select="text()"/>
		<xsl:if test="not(@nothrow) and @nullvalue">
			<xsl:value-of select="$lf"/>
			<xsl:value-of select="$t4"/>
			<xsl:text>throw new InvalidCastException(string.Format(</xsl:text>
			<xsl:value-of select="$lf"/>
			<xsl:value-of select="$t5"/>
			<xsl:text>"Invalid cast from {0} to {1}", typeof(P).FullName, typeof(T).FullName));</xsl:text>
		</xsl:if>
	</xsl:template>

	<!-- comments -->
	<xsl:template name ="comment">
		<xsl:if test="text()">
			<xsl:value-of select="$lf"/>
			<xsl:value-of select="$t3"/>
			<xsl:text>// </xsl:text>
			<xsl:value-of select="text()"/>
			<xsl:value-of select="$lf"/>
			<xsl:value-of select="$t3"/>
			<xsl:text>//</xsl:text>
		</xsl:if>
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<xsl:template match="comment">
		<xsl:call-template name="comment"/>
	</xsl:template>

	<xsl:template match="comment" mode ="def">
		<xsl:if test="not(@nullable) or @nullable!='true'">
			<xsl:call-template name="comment"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="comment" mode ="nuldef">
		<xsl:if test="@nullable='true'">
			<xsl:call-template name="comment"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="comment" mode ="body">
		<xsl:if test="not(@nullable) or @nullable!='true'">
			<xsl:call-template name="comment"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="comment" mode ="nulbody">
		<xsl:if test="@nullable='true'">
			<xsl:call-template name="comment"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="br">
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<xsl:template match="br" mode="def">
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<xsl:template match="br" mode="body">
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<xsl:template match="br" mode="runtime">
		<xsl:value-of select="$lf"/>
	</xsl:template>

	<!-- support function -->
	<xsl:template name="writeCode">
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="contains($code, '&#13;')">
				<!-- multi-line -->
				<xsl:value-of select="$lf"/>
				<xsl:value-of select="$t3"/>
				<xsl:text>{</xsl:text>
				<xsl:value-of select="$code"/>
				<xsl:value-of select="$lf"/>
				<xsl:value-of select="$t3"/>
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<!-- single-line -->
				<xsl:text> { </xsl:text>
				<xsl:value-of select="$code"/>
				<xsl:text> }</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- support function -->
	<xsl:template name="writeSpaces">
		<xsl:param name="count"/>
		<xsl:choose>
			<xsl:when test="$count&lt;1"/>
			<xsl:when test="$count=1">
				<xsl:value-of select="$s1"/>
			</xsl:when>
			<xsl:when test="$count=2">
				<xsl:value-of select="$s2"/>
			</xsl:when>
			<xsl:when test="$count=3">
				<xsl:value-of select="$s3"/>
			</xsl:when>
			<xsl:when test="$count=4">
				<xsl:value-of select="$s4"/>
			</xsl:when>
			<xsl:when test="$count=5">
				<xsl:value-of select="$s5"/>
			</xsl:when>
			<xsl:when test="$count=6">
				<xsl:value-of select="$s6"/>
			</xsl:when>
			<xsl:when test="$count=7">
				<xsl:value-of select="$s7"/>
			</xsl:when>
			<xsl:when test="$count=8">
				<xsl:value-of select="$s8"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$s8"/>
				<xsl:call-template name ="writeSpaces">
					<xsl:with-param name="count" select="$count - 8"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>