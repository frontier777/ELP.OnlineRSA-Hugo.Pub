{*<form class="span4 form-search" method="get" action="{'/content/search'|ezurl( 'no' )}" id="site-wide-search">
    <label class="pull-right">
        <span class="hidden">{'Search'|i18n('design/ezdemo/pagelayout')}</span>
        {if $pagedata.is_edit}
            <input class="search-query span3" type="search" name="SearchText" id="site-wide-search-field" placeholder="{'Search text'|i18n('design/ezdemo/pagelayout')}" disabled="disabled" />
        {else}
            <input class="search-query span3" type="search" name="SearchText" id="site-wide-search-field" placeholder="{'Search text'|i18n('design/ezdemo/pagelayout')}" />
            {if eq( $ui_context, 'browse' )}
             <input name="Mode" type="hidden" value="browse" />
            {/if}
        {/if}
    </label>
</form>*}
{* OnlineRSA Shopping Basket *}
<div class="container">
	<div class="row">
		<label class="pull-right">
    		<a href="https://elp.foxycart.com/cart?cart=view" class="foxycart" style="padding-top:10px;" title="{'Shopping cart'|i18n('design/ezdemo/pagelayout')}"><img src="{'shopping-cart-OnlineRSA.png'|ezimage( 'no' )}" width="30" style="padding-top:75px;" />&nbsp;{'Shopping cart'|i18n('design/ezdemo/pagelayout')}</a>
			{* <a href="tel:1300496337" style="padding-top:10px;"><img src="{'RSA-Certificate-Online-help-contact.png'|ezimage( 'no' )}" alt="Mobile users click here to call 1300 496 337"/> *}
		</label>
	</div>
</div>