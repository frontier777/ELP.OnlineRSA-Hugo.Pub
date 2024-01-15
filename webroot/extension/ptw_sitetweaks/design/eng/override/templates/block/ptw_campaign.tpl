{def $valid_nodes = $block.valid_nodes
     $images = array()
     $several = $valid_nodes|count|gt( 1 )}
<!-- BLOCK: START -->
<div class="block-type-campaign">
    <div class="campaign">
        <a href="#" class="navig prev" style="opacity:0;"><span class="hide">&lt;</span></a>
        <a href={cond( $several, $valid_nodes[1].url_alias|ezurl, '"#"' )} class="navig next{cond( $several|not, ' disabled', '' )}"><span class="hide">&gt;</span></a>
        <ul class="indicator{cond( $several|not, ' disabled', '' )}">
            {for 1 to $valid_nodes|count as $i}
            <li{cond( $i|eq( 1 ), ' class="selected"', '' )}><span class="hide">{$i}</span></li>
            {/for}
        </ul>
        <ul class="images">
        {foreach $valid_nodes as $k => $img_node}<li>{node_view_gui view='block_item_campaign' image_class='campaign' content_node=$img_node}</li>{/foreach}
        </ul>
    </div>
</div>
{* Get iterator delay *}
{* ref: https://doc.ez.no/eZ-Publish/Technical-manual/4.x/Reference/Template-operators/Data-and-information-extraction/ezini *}
{def $galleryInterationTimer=ezini('CustomBlockCampaign', 'galleryInterationTimer', 'ptw_sitetweaks_custom_gallery_iterator.ini' )}
<!-- BLOCK: END -->
{run-once}
<script type="text/javascript">
{literal}
YUI(YUI3_config).use('event', 'ezsimplegallery', function (Y) {
    Y.on('domready', function () {
        Y.all('.block-type-campaign').each(function () {
            var gal = new Y.eZ.SimpleGallery({
                gallery: this
            });
 	    setInterval(function () {gal.iterateNext()},{/literal}{* $galleryInterationTimer*}7000{literal});           
        });
    });
});
{/literal}
</script>
{/run-once}
{undef $valid_nodes $images $several}
