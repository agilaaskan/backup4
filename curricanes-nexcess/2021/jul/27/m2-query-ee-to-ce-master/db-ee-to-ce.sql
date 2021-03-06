SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE `catalog_product_entity`
    CHANGE `entity_id` `entity_id_ee` int(10) unsigned NOT NULL COMMENT 'Entity Id EE',
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`entity_id`),
    DROP KEY `CATALOG_PRODUCT_ENTITY_CREATED_IN`,
    DROP KEY `CATALOG_PRODUCT_ENTITY_UPDATED_IN`,
    DROP KEY `CATALOG_PRODUCT_ENTITY_ENTITY_ID_CREATED_IN_UPDATED_IN`,
    DROP FOREIGN KEY `CATALOG_PRODUCT_ENTITY_ENTITY_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE`;


-- -------- CATEGORY
ALTER TABLE catalog_category_entity
    CHANGE `entity_id` `entity_id_ee` int(10) unsigned NOT NULL COMMENT 'Entity Id EE',
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`entity_id`),
    DROP KEY `CAT_CTGR_ENTT_ENTT_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL`;

ALTER TABLE `catalog_category_entity_datetime`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
        DROP FOREIGN KEY `CAT_CTGR_ENTT_DTIME_ROW_ID_CAT_CTGR_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_CTGR_ENTT_DTIME_ROW_ID_CAT_CTGR_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE;



ALTER TABLE `catalog_category_entity_decimal`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
    DROP FOREIGN KEY `CAT_CTGR_ENTT_DEC_ROW_ID_CAT_CTGR_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_CTGR_ENTT_DEC_ROW_ID_CAT_CTGR_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE;



ALTER TABLE `catalog_category_entity_int`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
    DROP FOREIGN KEY `CAT_CTGR_ENTT_INT_ROW_ID_CAT_CTGR_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_CTGR_ENTT_INT_ROW_ID_CAT_CTGR_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE;



ALTER TABLE `catalog_category_entity_text`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    DROP FOREIGN KEY `CAT_CTGR_ENTT_TEXT_ROW_ID_CAT_CTGR_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_CTGR_ENTT_TEXT_ROW_ID_CAT_CTGR_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE;



ALTER TABLE `catalog_category_entity_varchar`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    DROP FOREIGN KEY `CAT_CTGR_ENTT_VCHR_ROW_ID_CAT_CTGR_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_CTGR_ENTT_VCHR_ROW_ID_CAT_CTGR_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE;


-- -------- PRODUCT

ALTER TABLE `catalog_product_bundle_option`
    DROP FOREIGN KEY `CAT_PRD_BNDL_OPT_OPT_ID_SEQUENCE_PRD_BNDL_OPT_SEQUENCE_VAL`,
    DROP FOREIGN KEY `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

-- not loading
ALTER TABLE `catalog_product_bundle_option_value`
    DROP KEY `CAT_PRD_BNDL_OPT_VAL_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID`,
    DROP FOREIGN KEY `CAT_PRD_BNDL_OPT_VAL_OPT_ID_SEQUENCE_PRD_BNDL_OPT_SEQUENCE_VAL`,
    DROP FOREIGN KEY `CAT_PRD_BNDL_OPT_VAL_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE;
-- not loading
ALTER TABLE `catalog_product_bundle_selection`
    DROP KEY `CAT_PRD_BNDL_SELECTION_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID`,
    DROP FOREIGN KEY `CAT_PRD_BNDL_SELECTION_OPT_ID_SEQUENCE_PRD_BNDL_OPT_SEQUENCE_VAL`,
    DROP FOREIGN KEY `CAT_PRD_BNDL_SELECTION_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID`,
    DROP FOREIGN KEY `CAT_PRD_BNDL_SELECTION_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`,
    DROP FOREIGN KEY `FK_606117FEB5F50D0182CEC9D260C05DD2`,
    ADD CONSTRAINT `CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
    ADD CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;


ALTER TABLE `catalog_product_bundle_selection_price`
    DROP KEY `CAT_PRD_BNDL_SELECTION_PRICE_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID`,
    DROP FOREIGN KEY `FK_AE9FDBF7988FB6BE3E04D91DA2CFB273`,
    DROP FOREIGN KEY `CAT_PRD_BNDL_SELECTION_PRICE_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE;

ALTER TABLE `catalog_product_entity_datetime`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRI_ID_STORE_ID_NEW` (`entity_id`,`attribute_id`,`store_id`),
    DROP FOREIGN KEY `CAT_PRD_ENTT_DTIME_ROW_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `catalog_product_entity_decimal`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRI_ID_STORE_ID_NEW` (`entity_id`,`attribute_id`,`store_id`),
    DROP FOREIGN KEY `CAT_PRD_ENTT_DEC_ROW_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `catalog_product_entity_gallery`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRI_ID_STORE_ID_NEW` (`entity_id`,`attribute_id`,`store_id`),
    ADD KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_NEW` (`entity_id`),
    DROP FOREIGN KEY `CAT_PRD_ENTT_GLR_ROW_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;


ALTER TABLE `catalog_product_entity_int`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID_NEW` (`entity_id`,`attribute_id`,`store_id`),
    DROP FOREIGN KEY `CATALOG_PRODUCT_ENTITY_INT_ROW_ID_CATALOG_PRODUCT_ENTITY_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;


ALTER TABLE `catalog_product_entity_media_gallery_value`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID_NEW` (`entity_id`),
    DROP FOREIGN KEY `CAT_PRD_ENTT_MDA_GLR_VAL_ROW_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;


ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID_NEW` (`value_id`,`entity_id`),
    DROP FOREIGN KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ROW_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `catalog_product_entity_text`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID_NEW` (`entity_id`,`attribute_id`,`store_id`),
    DROP FOREIGN KEY `CATALOG_PRODUCT_ENTITY_TEXT_ROW_ID_CATALOG_PRODUCT_ENTITY_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `catalog_product_entity_tier_price`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    DROP FOREIGN KEY `CAT_PRD_ENTT_TIER_PRICE_ROW_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `catalog_product_entity_varchar`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRI_ID_STORE_ID_NEW` (`entity_id`,`attribute_id`,`store_id`),
    DROP FOREIGN KEY `CAT_PRD_ENTT_VCHR_ROW_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `catalog_product_link`
    DROP FOREIGN KEY `CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID`,
    ADD CONSTRAINT `CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
    DROP FOREIGN KEY `CAT_PRD_LNK_LNKED_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`,
    ADD CONSTRAINT `CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;
-- not working
ALTER TABLE `catalog_product_option`
    DROP FOREIGN KEY `CATALOG_PRODUCT_OPTION_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;
-- not working
ALTER TABLE `catalog_product_relation`
    DROP FOREIGN KEY `CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID`,
    ADD CONSTRAINT `CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID_NEW` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
    DROP FOREIGN KEY `CAT_PRD_RELATION_CHILD_ID_SEQUENCE_PRD_SEQUENCE_VAL`,
    ADD CONSTRAINT `CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `catalog_product_super_attribute`
    DROP FOREIGN KEY `CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;
-- not working
ALTER TABLE `catalog_product_super_link`
    DROP FOREIGN KEY `CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
    DROP FOREIGN KEY `CAT_PRD_SPR_LNK_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`,
    ADD CONSTRAINT `CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;


ALTER TABLE `catalogrule`
    CHANGE `rule_id` `rule_id_ee` int(10) unsigned NOT NULL COMMENT 'Entity Id EE',
    CHANGE `row_id` `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`rule_id`),
    DROP KEY `CATALOGRULE_CREATED_IN`,
    DROP KEY `CATALOGRULE_UPDATED_IN`,
    DROP FOREIGN KEY `CATALOGRULE_RULE_ID_SEQUENCE_CATALOGRULE_SEQUENCE_VALUE`;

-- not working
ALTER TABLE `catalogrule_customer_group`
    ADD CONSTRAINT `CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE;
-- not working
ALTER TABLE `catalogrule_website`
    ADD CONSTRAINT `CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE;


-- ========== CMS

ALTER TABLE `cms_block`
    CHANGE `block_id` `block_id_ee` smallint(6) NOT NULL COMMENT 'Block Id EE',
    CHANGE `row_id` `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID',
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`block_id`),
    DROP KEY `CMS_BLOCK_CREATED_IN`,
    DROP KEY `CMS_BLOCK_UPDATED_IN`,
    DROP KEY `CMS_BLOCK_BLOCK_ID_SEQUENCE_CMS_BLOCK_SEQUENCE_VALUE`,
    DROP FOREIGN KEY `CMS_BLOCK_BLOCK_ID_SEQUENCE_CMS_BLOCK_SEQUENCE_VALUE`;

ALTER TABLE `cms_block_store`
    CHANGE `row_id` `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`block_id`,`store_id`),
    DROP FOREIGN KEY `CMS_BLOCK_STORE_ROW_ID_CMS_BLOCK_ROW_ID`,
    ADD CONSTRAINT `CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE;

ALTER TABLE `cms_page`
    CHANGE `page_id` `page_id_ee` smallint(6) NOT NULL COMMENT 'Entity Id EE',
    CHANGE `row_id` `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`page_id`),
    DROP KEY `CMS_PAGE_CREATED_IN`,
    DROP KEY `CMS_PAGE_UPDATED_IN`,
    DROP FOREIGN KEY `CMS_PAGE_PAGE_ID_SEQUENCE_CMS_PAGE_SEQUENCE_VALUE`;
    
-- not working
ALTER TABLE `cms_page_store`
    ADD CONSTRAINT `CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE;


-- ================== DOWLOADABLE PRODUCT
ALTER TABLE `downloadable_link`
    DROP FOREIGN KEY `DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID`,
    ADD CONSTRAINT `DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `downloadable_sample`
    DROP FOREIGN KEY `DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID`,
    ADD CONSTRAINT `DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;


-- =============== CART RULE

ALTER TABLE `salesrule`
    CHANGE `rule_id` `rule_id_ee` int(10) unsigned NOT NULL COMMENT 'RULE Id EE',
    CHANGE `row_id` `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`rule_id`),
    DROP KEY `SALESRULE_CREATED_IN`,
    DROP KEY `SALESRULE_UPDATED_IN`,
    DROP FOREIGN KEY `SALESRULE_RULE_ID_SEQUENCE_SALESRULE_SEQUENCE_VALUE`;

ALTER TABLE `salesrule_customer_group`
   ADD CONSTRAINT `SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE;

ALTER TABLE `salesrule_product_attribute`
   ADD CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE;

ALTER TABLE `salesrule_website`
   ADD CONSTRAINT `SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE;


DELETE FROM `eav_attribute`
WHERE `attribute_code` in ('giftcard_amounts', 'allow_open_amount', 'giftcard_type', 'related_tgtr_position_limit', 'related_tgtr_position_behavior', 'upsell_tgtr_position_limit', 'upsell_tgtr_position_behavior');

TRUNCATE TABLE `sequence_product`;
TRUNCATE TABLE `catalog_product_website`;
INSERT INTO sequence_product(sequence_value)
    SELECT entity_id FROM catalog_product_entity;
INSERT INTO catalog_product_website(product_id, website_id)
    SELECT entity_id, 1 FROM catalog_product_entity;



ALTER TABLE catalog_category_product
    DROP FOREIGN KEY `CAT_CTGR_PRD_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE catalog_compare_item
    DROP FOREIGN KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE`;

ALTER TABLE catalog_product_index_tier_price
    DROP FOREIGN KEY `CAT_PRD_IDX_TIER_PRICE_ENTT_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE catalog_product_bundle_price_index
    DROP FOREIGN KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE`;

ALTER TABLE catalog_product_website
    DROP FOREIGN KEY `CAT_PRD_WS_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE catalog_url_rewrite_product_category
    DROP FOREIGN KEY `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE cataloginventory_stock_item
    DROP FOREIGN KEY `CATINV_STOCK_ITEM_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE email_catalog
    DROP FOREIGN KEY `EMAIL_CATALOG_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE`;

ALTER TABLE magento_giftregistry_item
    DROP FOREIGN KEY `MAGENTO_GIFTREGISTRY_ITEM_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE magento_targetrule_product
    DROP FOREIGN KEY `MAGENTO_TARGETRULE_PRD_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE product_alert_price
    DROP FOREIGN KEY `PRODUCT_ALERT_PRICE_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE`;

ALTER TABLE product_alert_stock
    DROP FOREIGN KEY `PRODUCT_ALERT_STOCK_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE`;

ALTER TABLE report_compared_product_index
    DROP FOREIGN KEY `REPORT_CMPD_PRD_IDX_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE report_viewed_product_aggregated_daily
    DROP FOREIGN KEY `REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE report_viewed_product_aggregated_monthly
    DROP FOREIGN KEY `FK_0140003A30AFC1A9188D723C4634BA5D`;

ALTER TABLE report_viewed_product_aggregated_yearly
    DROP FOREIGN KEY `REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE report_viewed_product_index
    DROP FOREIGN KEY `REPORT_VIEWED_PRD_IDX_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL`;

ALTER TABLE weee_tax
    DROP FOREIGN KEY `WEEE_TAX_ENTITY_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE`;

ALTER TABLE wishlist_item
    DROP FOREIGN KEY `WISHLIST_ITEM_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE`;


-- -------- CATEGORY
SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE catalog_category_entity
 DROP FOREIGN KEY `CAT_CTGR_ENTT_ENTT_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL`;


ALTER TABLE `catalog_category_entity_datetime`
    DROP INDEX `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID`,
    DROP KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID`,
    ADD KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`);



ALTER TABLE `catalog_category_entity_decimal`
    DROP INDEX `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID`,
    DROP KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID`,
    ADD KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`);



ALTER TABLE `catalog_category_entity_int`
    DROP INDEX `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID`,
    DROP KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID`,
    ADD KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`);


ALTER TABLE `catalog_category_entity_text`
    DROP INDEX `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID`,
    ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
    DROP KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID`,
    ADD KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`);



ALTER TABLE `catalog_category_entity_varchar`
    DROP INDEX `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID`,
    ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
    DROP KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID`,
    ADD KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`);

SET FOREIGN_KEY_CHECKS = 1;
