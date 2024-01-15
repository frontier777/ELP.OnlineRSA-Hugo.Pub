{def $valid_nodes = $block.valid_nodes}

<div class="block-type-content-grid block-view-{$block.view}">

    {if ne( $block.name, '' )}
    <div class="attribute-header">
        <h2>{$block.name|wash()}</h2>
    </div>
    {/if}

    <div class="row">
    {foreach $valid_nodes as $valid_node}
        <div class="span3">
<article>
{if $block.custom_attributes.showtitlelink|eq(true)}
<a href="{concat('/content/view/full/',$valid_node.node_id)|ezurl('no','full')}" class="teaser-link" style='text-align:center;'>
{/if}
    {if $valid_node.data_map.image.has_content}
        <div class="attribute-image"> 
            {attribute_view_gui attribute=$valid_node.data_map.image image_class=$image_class}
        </div>
    {/if}
        <div class="attribute-header">
       		{if $block.custom_attributes.showtitle|eq(true)}
            <h3>{$valid_node.name|wash()}</h3>
            {/if}
        </div>
    {if $block.custom_attributes.showtitlelink|eq(true)}
    </a>
    {/if}
    <div class="attribute-short">
        {attribute_view_gui attribute=$valid_node.data_map.intro}
    </div>
</article>
        </div>
        {delimiter modulo=4}
        </div>
        <div class="row">
        {/delimiter}
    {/foreach}
    </div>

</div>

{undef $valid_nodes}
