<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="utf-8" omit-xml-declaration="yes" standalone="yes" indent="yes" media-type="text/plain" />

	<xsl:template match="/checkstyle">
		<xsl:choose>
			<xsl:when test="@version = '1.4.4'">
				<xsl:call-template name="checkstyle-1.4.4">
					<xsl:with-param name="doc" select="." />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				Cannot detect checkstyle version
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="checkstyle-1.4.4">
		<xsl:param name="doc" />

		<xsl:choose>
			<xsl:when test="count($doc/file) = 0">
				<span class="icon icon-checked">Code quality passed</span>
			</xsl:when>
			<xsl:otherwise>
				<table class="list errors">
					<thead>
						<tr>
							<th width="70">Line</th>
							<th width="70">Col</th>
							<th width="70">Severity</th>
							<th>Details</th>
							<th>Source</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$doc/file">
							<xsl:variable name="file" select="." />

							<tr class="group open">
								<td colspan="5">
									<span class="expander" onclick="toggleRowGroup(this);">&#160;</span>

									<xsl:value-of select="$file/@name" />
									<xsl:text ></xsl:text>
									<span class="count">
										(<xsl:value-of select="count($file/error)" />)
									</span>

									<a class="toggle-all" href="#" onclick="toggleAllRowGroups(this); return false;">Collapse all/Expand all</a>
								</td>
							</tr>

							<xsl:for-each select="$file/error">
								<xsl:variable name="error" select="." />

								<tr>
									<xsl:attribute name="class">
										<xsl:text>error </xsl:text>

										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">
												<xsl:text>odd </xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>even </xsl:text>
											</xsl:otherwise>
										</xsl:choose>

										<xsl:choose>
											<xsl:when test="$error/@severity = 'error'">
												<xsl:text>priority-4</xsl:text>
											</xsl:when>
											<xsl:when test="$error/@severity = 'warning'">
												<xsl:text>priority-2</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>priority-1</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>

									<td class="line">Line <xsl:value-of select="$error/@line" /></td>
									<td class="col">Col <xsl:value-of select="$error/@column" /></td>
									<td class="severity"><xsl:value-of select="$error/@severity" /></td>
									<td class="message"><xsl:value-of select="$error/@message" /></td>
									<td class="source"><xsl:value-of select="$error/@source" /></td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>