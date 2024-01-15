{def $valid_nodes = $block.valid_nodes}

{* PTW 2014-11-16 NOTE that this is a non-standard mix of the 2 item block and a normal article template (boxy, tags, social) *}
{* It probably should be just a single article template *}
<div class="block-type-content-grid block-view-{$block.view}">

    {if ne( $block.name, '' )}
    <div class="attribute-header">
        <h2>{$block.name|wash()}</h2>
    </div>
    {/if}

    {foreach $valid_nodes as $valid_node max 1}
        {* node_view_gui view='block_item' image_class='contentgrid' content_node=$valid_node *}
        <article>

    {*<a href="{$valid_node.url_alias|ezurl( 'no' )}" class="teaser-link">
    {if $valid_node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui attribute=$valid_node.data_map.image image_class=$image_class}
        </div>
    {/if}
        <div class="attribute-header">
            <h3>{$valid_node.name|wash()}</h3>
        </div>
    </a>*}

        {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$valid_node.data_map.body}
            </div>
        {/if}
{*
        <div class="attribute-tags">
			{attribute_view_gui attribute=$valid_node.data_map.tags}
        </div>

       <div class="attribute-socialize">
			{include uri='design:parts/social_buttons.tpl'}
       </div>*}
		</article>
    {/foreach}
</div>

{undef $valid_nodes}
