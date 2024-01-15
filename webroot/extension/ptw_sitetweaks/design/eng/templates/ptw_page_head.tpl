{default enable_help=true() enable_link=true() canonical_link=true()}

{let name=Path
     path=$module_result.path
     reverse_path=array()}
  {if is_set($pagedata.path_array)}
    {set path=$pagedata.path_array}
  {elseif is_set($module_result.title_path)}
    {set path=$module_result.title_path}
  {/if}
  {section loop=$:path}
    {set reverse_path=$:reverse_path|array_prepend($:item)}
  {/section}

{set-block scope=root variable=site_title}
{section loop=$Path:reverse_path}{$:item.text|wash}{delimiter} / {/delimiter}{/section} - {$site.title|wash}
{/set-block}

{/let}
    
    {if and(is_set($#Header:extra_data),is_array($#Header:extra_data))}
      {section name=ExtraData loop=$#Header:extra_data}
      {$:item}
      {/section}
    {/if}

    {* check if we need a http-equiv refresh *}
    {if $site.redirect}
    <meta http-equiv="Refresh" content="{$site.redirect.timer}; URL={$site.redirect.location}" />

    {/if}
    {foreach $site.http_equiv as $key => $item}
        <meta name="{$key|wash}" content="{$item|wash}" />

    {/foreach}

{def $meta = metadata( $module_result.node_id ) }
{if $meta}
	{if $meta.title}
	    <title>{$meta.title|wash}</title>
	{/if}
	{if $meta.keywords}
	    <meta name="keywords" content="{$meta.keywords|implode(',')|wash}" />
	{/if}
	{if $meta.description}
	    <meta name="description" content="{$meta.description|wash}" />
	{/if}
{else} 
    {* ADDED PTW 2017-02-01 If we are in the root node (node_id = 2), then replace the "Home" in the site title with "RSA Online" - otherwise, do nothing *}
    {* VERSION1:  if eq($module_result.node_id,'2')}<title>{$site_title|replace(0,4,"RSA Online")}</title>{else}<title>{$site_title}</title>{/if *}
    <title>{$site_title|explode('Home -')|implode('RSA Online -')}</title>
    {foreach $site.meta as $key => $item }
    <meta name="{$key|wash}" content="{$item|wash}" />
    {/foreach}
{/if}
    <meta name="MSSmartTagsPreventParsing" content="TRUE" />
    <meta name="generator" content="eZ Publish" />
    <meta property="fb:admins" content="1039792485" /> {* ADDED PTW 2014-10-27 *}

{if $canonical_link}
    {include uri="design:canonical_link.tpl"}
{/if}

{if $enable_link}
    {* include uri="design:link.tpl" enable_help=$enable_help enable_link=$enable_link *}
    {include uri="design:ptw_link.tpl" enable_help=$enable_help enable_link=$enable_link} {* 2015-03-10 PTW Customised to exclude print links *} 
{/if}

{/default}
