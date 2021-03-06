<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${basePackage}.${moduleName}.${daoPackage}.${entityCamelName}Dao" >
  	<resultMap id="BaseResultMap" type="${basePackage}.${moduleName}.${entityPackage}.${entityCamelName}" >
    	<id column="${primaryKey}" property="${primaryProperty}" />
	    <#list columns as col>
	    <#if !col.primaryKey>
	    <result column="${col.columnName}" property="${col.propertyName}" />
	    </#if>
	    </#list>
  	</resultMap>
  
  	<sql id="table_columns" >
	    <#list columns as col>
	    ${col.columnName}<#if col_index lt columns?size-1>,</#if>
	    </#list>
  	</sql>
  	<sql id="entity_properties">
	  	<#list columns as col>
	  	${'#'}{${col.propertyName}}<#if col_index lt columns?size-1>,</#if>
	  	</#list>
  	</sql>
  
  	<insert id="save" parameterType="${basePackage}.${moduleName}.${entityPackage}.${entityCamelName}">
	  	INSERT INTO ${tableFullName} ( <include refid="table_columns" /> ) 
	  	VALUES ( <include refid="entity_properties" /> )
  	</insert>
  
  	<delete id="delete" parameterType="${primaryPropertyType}">
  		DELETE FROM ${tableFullName} 
  		WHERE ${primaryKey}=${'#'}{${primaryProperty}}
  	</delete>
  
  	<delete id="deleteByIds">
		DELETE FROM ${tableFullName}
		WHERE id IN
		<foreach item="item" collection="array" open="(" separator="," close=")">
			${'#'}{item}
		</foreach>
  	</delete>
  
  	<update id="update" parameterType="${basePackage}.${moduleName}.${entityPackage}.${entityCamelName}">
	  	UPDATE ${tableFullName} 
	  	<trim prefix="set" suffixOverrides=",">
		  	<#list columns as col>
		  	<#if col_index gt 0 && !col.primaryKey>
		  	<if test="${col.propertyName} != null and ${col.propertyName} != ''">${col.columnName} = ${'#'}{${col.propertyName}},</if>
		  	</#if>
		  	</#list>
	  	</trim>
	  	<where>${primaryKey!}=${'#'}{${primaryProperty!}}</where>
  	</update>
  
  	<select id="findById" resultMap="BaseResultMap" parameterType="${primaryPropertyType}">
  		SELECT <include refid="table_columns"/> 
  		FROM ${tableFullName} 
  		WHERE ${primaryKey!}=${'#'}{id}
  	</select>
  	
  	<select id="queryAll" resultMap="BaseResultMap">
  		SELECT <include refid="table_columns"/> 
  		FROM ${tableFullName} 
  	</select>
  	
  	<sql id="sel_where">
	  	<trim prefix="where" prefixOverrides="and |or ">
		  	<#list columns as col>
		  	<#if col_index gt 0 && !col.primaryKey>
		  	<if test="${col.propertyName} != null and ${col.propertyName} != ''">and ${col.columnName} = ${'#'}{${col.propertyName}}</if>
		  	</#if>
		  	</#list>
	  	</trim>
  	</sql>
  	
  	<select id="search" resultMap="BaseResultMap" parameterType="${basePackage}.${moduleName}.${entityPackage}.${entityCamelName}">
  		SELECT <include refid="table_columns"/> 
  		FROM ${tableFullName}
  		<include refid="sel_where" />
  	</select>
  	
  	<select id="count" resultType="int" parameterType="${basePackage}.${moduleName}.${entityPackage}.${entityCamelName}">
	  	SELECT COUNT(id) 
	  	FROM ${tableFullName}
	  	<include refid="sel_where" />
  	</select>
  	
  	<!-- 分页查询条件，供datatables插件查询使用 -->
  	<sql id="page_where">
  		<if test="condition != null">
		  	<trim prefix="where" prefixOverrides="and |or ">
			  	<#list columns as col>
			  	<#if col_index gt 0 && !col.primaryKey>
			  	<if test="condition.${col.propertyName} != null and condition.${col.propertyName} != ''">and ${col.columnName} = ${'#'}{condition.${col.propertyName}}</if>
			  	</#if>
			  	</#list>
		  	</trim>
	  	</if>
  	</sql>
  	
  	<!-- 查询条数，供datatables插件查询使用 -->
  	<select id="countPage" resultType="int">
	  	SELECT COUNT(id) 
	  	FROM user
	  	<include refid="page_where" />
  	</select>
  
  	<!-- 分页查询，供datatables插件查询使用 -->
  	<select id="searchPage" resultMap="BaseResultMap">
  		SELECT <include refid="table_columns"/> 
  		FROM user
  		<include refid="page_where" />
  		<include refid="order"/>
  		<include refid="limit"/>
  	</select>
  	
  	<!-- 排序，供datatables插件查询使用 -->
  	<sql id="order">
  		<if test="condition.orderColumn != null and condition.orderColumn != ''">ORDER BY ${'$'}{condition.orderColumn} ${'$'}{condition.orderDir}</if>
  	</sql>
  	
  	<!-- 分页，供datatables插件查询使用  -->
  	<sql id="limit">
  		LIMIT ${'#'}{start}, ${'#'}{length}
  	</sql>
  	
  	<!-- 其他自定义SQL -->
  	
</mapper>