{* DEBUG <!-- PTW HOVERBUTTON:{$hover_button_class} --> *}
{def $buttonup="none"}
{def $buttondown="none"}
{switch match=$hover_button_class}
{case match='RSA_ACT'}{* RSA_ACT *}
{set $buttonup="buttons/buttonsupact.png"}
{set $buttondown="buttons/buttonsdownact.png"}
{/case}
{case match='RSA_NSW'}{* RSA_NSW *}
{set $buttonup="buttons/buttonsupnsw.png"}
{set $buttondown="buttons/buttonsdownnsw.png"}
{/case}
{case match='RSA_NT'}{* RSA_NT *}
{set $buttonup="buttons/buttonsupnt.png"}
{set $buttondown="buttons/buttonsdownnt.png"}
{/case}
{case match='RSA_QLD'}{* RSA_QLD *}
{set $buttonup="buttons/buttonsupqld.png"}
{set $buttondown="buttons/buttonsdownqld.png"}
{/case}
{case match='RSA_SA'}{* RSA_SA *}
{set $buttonup="buttons/buttonsupsa.png"}
{set $buttondown="buttons/buttonsdownsa.png"}
{/case}
{case match='RSA_TAS'}{* RSA_TAS *}
{set $buttonup="buttons/buttonsuptas.png"}
{set $buttondown="buttons/buttonsdowntas.png"}
{/case}
{case match='RSA_VIC'}{* RSA_VIC *}
{set $buttonup="buttons/buttonsupvic.png"}
{set $buttondown="buttons/buttonsdownvic.png"}
{/case}
{case match='RSA_WA'}{* RSA_WA *}
{set $buttonup="buttons/buttonsupwa.png"}
{set $buttondown="buttons/buttonsdownwa.png"}
{/case}
{case match='RSA_ALL'}{* RSA_ALL *}
{set $buttonup="buttons/buttonsupall.png"}
{set $buttondown="buttons/buttonsdownall.png"}
{/case}
{case match='Start_Now'}{* Start Now *}
{set $buttonup="buttons/buttonsupstartnow.png"}
{set $buttondown="buttons/buttonsdownstartnow.png"}
{/case}
{case match='Buy_Now'}{* Buy Now *}
{set $buttonup="buttons/buttonsupbuynoweway.png"}
{set $buttondown="buttons/buttonsdownbuynoweway.png"}
{/case}
{case match='Class_Times'}{* Class Times *}
{set $buttonup="buttons/buttonsupclass.png"}
{set $buttondown="buttons/buttonsdownclass.png"}
{/case}
{case match='FAQ'}{* FAQ *}
{set $buttonup="buttons/buttonsupFAQ.png"}
{set $buttondown="buttons/buttonsdownFAQ.png"}
{/case}
{/switch}
{* only display button if non-empty values *}
{if and(ne($buttonup,"none"),ne($buttondown,"none"))}
{* DEBUG <!-- up:{$buttonup} down:{$buttondown} --> *}
{* Removed unwanted no-alt tag: 	<div align="center">{literal}<img src={/literal}"{$buttonup|ezimage( 'no' )}" data-hover-src="{$buttondown|ezimage( 'no' )}" no_alt="{$hover_button_alt_tag}" {literal}>{/literal}</div> *}
{literal}<div align="center"><img src={/literal}"{$buttonup|ezimage( 'no' )}" data-hover-src="{$buttondown|ezimage( 'no' )}" {literal}></div>{/literal}
{/if}
{undef $buttonup $buttondown}