<!-- Path content: START -->
<div class="container">
    <ul class="breadcrumb">
    {foreach $pagedata.path_array as $path}
    {if $path.url}
        <li>
            <a href={cond( and( is_set( $path.url_alias ), $path.url_alias|begins_with('rsa/')|not ),
	    $path.url_alias|explode('rsa')|implode(''),
	    cond( and( is_set( $path.url_alias ), $path.url_alias|begins_with('rsa/') ),
	          $path.url_alias, $path.url ) )|ezurl}>{if or(
	    $path.url_alias|eq(''),
	    and( $path.url_alias|begins_with('rsa'), $path.url_alias|eq('rsa') )
	    )}{if $path.text|eq('rsa')}{$path.text|explode('rsa')|implode('RSA Home')|wash}{else}{$path.text|wash}{/if}
	    {else}{$path.text|wash}{/if}</a> <span class="divider">&raquo;</span>
        </li>
    {else}
        <li class="active">
            {if $path.text|eq('rsa')}{$path.text|explode('rsa')|implode('RSA Home')|wash}{else}{$path.text|wash}{/if}
        </li>
    {/if}
    {/foreach}
    </ul>
</div>
<!-- Path content: END -->
