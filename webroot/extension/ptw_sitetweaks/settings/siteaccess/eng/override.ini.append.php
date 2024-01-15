<?php /* #?ini charset="utf-8"?

# [pagelayout_main]
# Source=pagelayout.tpl
# MatchFile=pagelayout.tpl
# Subdir=templates

[ptw-override-dud-text-centering-for-guarantee-image]
Source=content/view/embed.tpl
MatchFile=embed/ptw_image.tpl
Subdir=templates
Match[class_identifier]=image
Match[object]=493

[ptw-override-switchable-social-buttons-for-articles]
Source=parts/social_buttons.tpl
MatchFile=parts/ptw_social_buttons.tpl
Subdir=templates
Match[class_identifier]=article

[ptw_sitetweaks_ArticleBodyOnlyBlock]
Source=block/view/view.tpl
MatchFile=block/articlebodyonlyblock_default.tpl
Subdir=templates
Match[type]=ArticleBodyOnlyBlock
#Match[view]=default

[ptw_custom_block_1_column_2_rows]
Source=block/view/view.tpl
MatchFile=block/ptw_custom_content_grid_1col_2rows.tpl
Subdir=templates
Match[type]=ContentGrid_custom
Match[view]=default

[ptw_custom_block_1_column_4_rows]
Source=block/view/view.tpl
MatchFile=block/ptw_custom_content_grid_1col_4rows.tpl
Subdir=templates
Match[type]=ContentGrid_custom
Match[view]=1_column_4_rows

[ptw_custom_block_2_columns_2_rows]
Source=block/view/view.tpl
MatchFile=block/ptw_custom_content_grid_2cols_2rows.tpl
Subdir=templates
Match[type]=ContentGrid_custom
Match[view]=2_columns_2_rows

[ptw_custom_block_3_columns_1_row]
Source=block/view/view.tpl
MatchFile=block/ptw_custom_content_grid_3cols_1row.tpl
Subdir=templates
Match[type]=ContentGrid_custom
Match[view]=3_columns_1_row

[ptw_custom_block_3_columns_2_rows]
Source=block/view/view.tpl
MatchFile=block/ptw_custom_content_grid_3cols_2rows.tpl
Subdir=templates
Match[type]=ContentGrid_custom
Match[view]=3_columns_2_rows

[ptw_custom_block_4_columns_1_row]
Source=block/view/view.tpl
MatchFile=block/ptw_custom_content_grid_4cols_1row.tpl
Subdir=templates
Match[type]=ContentGrid_custom
Match[view]=4_columns_1_row

[ptw_custom_block_4_columns_2_rows]
Source=block/view/view.tpl
MatchFile=block/ptw_custom_content_grid_4cols_2rows.tpl
Subdir=templates
Match[type]=ContentGrid_custom
Match[view]=4_columns_2_rows

[ptw_custom_block_article_no_link]
Source=block/view/block_item.tpl
MatchFile=ptw_block_item/article_no_title_link.tpl
Subdir=templates
Match[class_identifier]=article
Match[view]=ptw_block_item
*/ ?>
