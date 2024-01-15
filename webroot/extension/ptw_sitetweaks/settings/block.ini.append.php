# Setting file for ezflow blocks as used by the Layout datatype
# A layout is divided into zones and then blocks, take a look in
# zone.ini for zone definitions.
 
[General]
AllowedTypes[]=ArticleBodyOnlyBlock
AllowedTypes[]=ContentGrid_custom

#[Example]
# Name of the block type as shown in the editorial interface.
# Name=Fetch Name Shown In Editorial Interface
# How many items are valid, as the new ones are being added, the oldest ones
# are moved to archive (or moved to another block) so that in any moment,
# max. NumberOfValidItems are valid.
# NumberOfValidItems=10
# NumberOfArchivedItems=5
# ManualAddingOfItems=disabled
# Optional: set the browse mode start node when manual adding of items is enabled
# ManualBlockStartBrowseNode=<node_id>
# TTL=86400
# FetchClass=ezmExample
# FetchFixedParameters[]
# FetchFixedParameters[Class]=article;folder
# FetchFixedParameters[...]=...
# FetchParameters[]
# FetchParametersIsRequired[]
# FetchParameters[Source]=NodeID
# FetchParametersIsRequired[Source]=true
# single / multiple
# FetchParametersSelectionType[Source]=single
# true / false
# FetchParametersIsRequired[Source]=true
# FetchParameters[...]=string
# FetchParameters[...]=integer
# Optional: set the browse mode start node if using a source
# DynamicBlockStartBrowseNode=<node_id>
# CustomAttributes[]=node_id
# CustomAttributes[]=color
# Name of the custom attribute shown in the editorial interface
# CustomAttributeNames[node_id]=Node ID
# CustomAttributeNames[color]=Color
# text / checkbox / select / string (default)
# CustomAttributeTypes[node_id]=string
# CustomAttributeTypes[color]=select
# CustomAttributeSelection_color[]
# CustomAttributeSelection_color[blue]=Blue
# CustomAttributeSelection_color[green]=Green
# UseBrowseMode[node_id]=true
# Optional: set the browse mode start node for a custom attribute
# CustomAttributeStartBrowseNode[node_id]=<node_id>
# ViewList[]=variation1
# ViewName[variation1]=Main story 1
#
# Used by browse mode for manual block,
# possibility to limit block items to specific class
# AllowedClasses[]=article

#
# PTW MainStory Tweak to allow 6 items...
#

[MainStory]
NumberOfArchivedItems=6

# END Mainstory

[ArticleBodyOnlyBlock]
Name=Display only Article Body Block
NumberOfValidItems=1
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]=2_items1
ViewList[]=2_items2
ViewName[2_items1]=Show heading (1)
ViewName[2_items2]=Don't show heading (2)

[ContentGrid_custom]
Name=Content Grid (PTW Tweaked)
NumberOfValidItems=8
NumberOfArchivedItems=8
ManualAddingOfItems=enabled
CustomAttributes[]=showtitlelink
CustomAttributes[]=showtitle
CustomAttributeNames[showtitlelink]=Enable header link
CustomAttributeNames[showtitle]=Enable header
CustomAttributeTypes[showtitlelink]=select
CustomAttributeSelection_showtitlelink[]
CustomAttributeSelection_showtitlelink[true]=Include title link
CustomAttributeSelection_showtitlelink[false]=Don't include title link
CustomAttributeTypes[showtitle]=select
CustomAttributeSelection_showtitle[]
CustomAttributeSelection_showtitle[true]=Include title
CustomAttributeSelection_showtitle[false]=Don't include title
ViewList[]
ViewList[]=default
ViewList[]=1_column_4_rows
ViewList[]=2_columns_2_rows
ViewList[]=3_columns_1_row
ViewList[]=3_columns_2_rows
ViewList[]=4_columns_1_row
ViewList[]=4_columns_2_rows
ViewName[default]=1 column 2 rows
ViewName[1_column_4_rows]=1 column 4 rows
ViewName[2_columns_2_rows]=2 columns 2 rows
ViewName[3_columns_1_row]=3 columns 1 row
ViewName[3_columns_2_rows]=3 columns 2 rows
ViewName[4_columns_1_row]=4 columns 1 row
ViewName[4_columns_2_rows]=4 columns 2 rows
