<!DOCTYPE html>
<!-- HELLO PAUL -->
<!--[if lt IE 9 ]><html class="unsupported-ie ie" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="{$site.http_equiv.Content-language|wash}"><!--<![endif]-->
<head>
{* OPTIMIZELY CODE - FROM ACM 2014-11-07 - DISABLED *}{* <script src="//cdn.optimizely.com/js/2187392278.js"></script> *}
{def $basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}

{include uri='design:page_head_displaystyles.tpl'}

{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{def $pagedata        = ezpagedata()
     $inner_column_size = $pagedata.inner_column_size
     $outer_column_size = $pagedata.outer_column_size}

{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
{def $pagestyle        = $pagedata.css_classes
     $locales          = fetch( 'content', 'translation_list' )
     $current_node_id  = $pagedata.node_id}

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

{include uri='design:ptw_page_head.tpl'} {* PTW CUSTOM *}
{include uri='design:page_head_style.tpl'}
{include uri='design:page_head_script.tpl'}

</head>
<body>
<!-- Facebook code - like and follow: START -->
{literal}
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
{/literal}
<!-- Facebook code - like and follow: END -->
<!-- Complete page area: START -->

<div id="page" class="{$pagestyle}">

    {if and( is_set( $pagedata.persistent_variable.extra_template_list ),
             $pagedata.persistent_variable.extra_template_list|count() )}
    {foreach $pagedata.persistent_variable.extra_template_list as $extra_template}
        {include uri=concat('design:extra/', $extra_template)}
    {/foreach}
    {/if}

    <!-- Header area: START -->
    {include uri='design:ptw_page_header.tpl'} {* PTW CUSTOM *}
    <!-- Header area: END -->

    {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}

    <div class="navbar main-navi">
        <!-- Top menu area: START -->
        {if $pagedata.top_menu}
            {include uri='design:page_topmenu.tpl'}
        {/if}
        <!-- Top menu area: END -->

        <!-- Path area: START -->
        {if $pagedata.show_path}
            {include uri='design:page_toppath.tpl'}
        {/if}
        <!-- Path area: END -->
    </div>

    <!-- Toolbar area: START -->
    {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
        {include uri='design:page_toolbar.tpl'}
    {/if}
    <!-- Toolbar area: END -->

    <!-- Columns area: START -->
    <div class="container">
        <div class="row">
            <!-- Side menu area: START -->
            {if $pagedata.left_menu}
                {include uri='design:page_leftmenu.tpl'}
            {/if}
            <!-- Side menu area: END -->
    {/cache-block}
    {/cache-block}
            <!-- Main area: START -->
            {include uri='design:page_mainarea.tpl'}
            <!-- Main area: END -->
            {cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}

            <!-- Extra area: START -->
            {if $pagedata.extra_menu}
                {include uri='design:page_extramenu.tpl'}
            {/if}
            <!-- Extra area: END -->
        </div>
    </div>
    <!-- Columns area: END -->

    <!-- Footer area: START -->
    {include uri='design:ptw_page_footer.tpl'} {* PTW CUSTOM *}
    <!-- Footer area: END -->

</div>
<!-- Complete page area: END -->

<!-- Footer script area: START -->
{include uri='design:page_footer_script.tpl'}
<!-- Footer script area: END -->

{/cache-block}

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
</body>
</html>
