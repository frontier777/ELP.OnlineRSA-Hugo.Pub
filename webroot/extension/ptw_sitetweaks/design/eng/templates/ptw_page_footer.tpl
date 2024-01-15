<!-- Footer area: START -->
{def $showreviews = ezini( 'GoogleReview', 'ShowOnNodeID', 'onlinersa.ini' )}
{if $showreviews|contains( $pagedata.node_id )}
    {literal}<script src="https://apis.google.com/js/platform.js?onload=renderBadge" async defer></script>{/literal}
    {ezscript_require( 'google_shopping_review.js' )}
{/if}

<div class="attribute-socialize">
	{include uri='design:parts/ptw_footer_social_buttons.tpl'}
</div>
{def $footer_node = fetch( 'content', 'node', hash( 'node_id', ezini( 'FooterSettings', 'NodeID', 'content.ini' ) ) )}
<footer>
    <div class="claim-wrapper">
        <div class="container">
            <div class="nav-collapse">
                
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="span12">
                {include uri='design:footer/ptw_address.tpl' node=$footer_node}
            </div>
            {*
            <div class="span4 nav-collapse">
                {include uri='design:footer/ptw_latest_news.tpl'}
            </div>*}
        </div>
        <div class="row">
            <div class="span12">
                {include uri='design:footer/ptw_links.tpl' node=$footer_node}
            </div>        
        </div>
    </div>
    

</footer>
<!-- Footer area: END -->
{undef $footer_node}
<!-- Footer extra: START -->
{* START: Google remarketing tag, added PTW 2016-02-08 *}
{literal}
<!-- Google Code for Remarketing Tag -->
<!--------------------------------------------------
Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. See more information and instructions on how to setup the tag on: http://google.com/ads/remarketingsetup
--------------------------------------------------->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1068680404;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1068680404/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
{/literal}
{* END: Google remarketing tag *}
<!-- Footer extra: END -->
