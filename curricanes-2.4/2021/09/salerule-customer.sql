--
-- Table structure for table `salesrule_customer`
--

DROP TABLE IF EXISTS `salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer ID',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`),
  CONSTRAINT `SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_customer`
--

LOCK TABLES `salesrule_customer` WRITE;
/*!40000 ALTER TABLE `salesrule_customer` DISABLE KEYS */;
INSERT INTO `salesrule_customer` VALUES 
(5, 4, 11441, 2),
(16, 3, 1574, 12),
(17, 6, 1209, 7),
(18, 7, 1209, 26),
(23, 4, 202, 12),
(30, 6, 403, 8),
(31, 4, 26, 16),
(34, 6, 7073, 2),
(35, 7, 7073, 3),
(49, 3, 11442, 22),
(59, 2, 61, 9),
(81, 1, 11706, 1),
(82, 6, 11706, 1),
(83, 7, 11706, 1),
(94, 1, 403, 2),
(95, 7, 403, 24),
(97, 4, 386, 21),
(98, 3, 1634, 12),
(100, 6, 1233, 4),
(106, 6, 1237, 2),
(107, 1, 85, 10),
(108, 6, 85, 19),
(109, 7, 85, 33),
(128, 4, 1445, 2),
(131, 3, 31, 5),
(179, 4, 1661, 8),
(182, 4, 83, 16),
(184, 3, 581, 6),
(202, 4, 6712, 1),
(204, 2, 612, 3),
(206, 7, 423, 1),
(227, 7, 12620, 7),
(230, 6, 12620, 2),
(238, 4, 11440, 13),
(251, 6, 338, 1),
(252, 8, 338, 4),
(253, 7, 338, 5),
(264, 4, 672, 9),
(268, 3, 2086, 2),
(297, 4, 148, 11),
(307, 7, 1233, 23),
(320, 4, 2148, 2),
(328, 4, 780, 4),
(419, 4, 16786, 6),
(442, 6, 228, 2),
(443, 7, 228, 2),
(486, 3, 2593, 2),
(531, 2, 3103, 1),
(535, 1, 9678, 2),
(536, 7, 9678, 6),
(545, 8, 9678, 1),
(546, 6, 9678, 2),
(588, 7, 284, 1),
(589, 4, 4942, 3),
(694, 7, 23501, 3),
(719, 8, 1233, 3),
(730, 4, 24147, 12),
(748, 6, 799, 1),
(754, 1, 26290, 1),
(755, 7, 26290, 5),
(759, 7, 28806, 42),
(812, 3, 19097, 8),
(821, 7, 4035, 1),
(824, 8, 28806, 2),
(829, 4, 220, 2),
(845, 7, 29103, 50),
(846, 6, 28806, 9),
(868, 6, 23501, 1),
(896, 7, 799, 2),
(944, 7, 14796, 1),
(945, 6, 14796, 1),
(976, 7, 4829, 3),
(977, 6, 4829, 3),
(1099, 1, 29103, 5),
(1151, 6, 7623, 1),
(1309, 8, 85, 3),
(1312, 42, 29710, 2),
(1320, 42, 29528, 2),
(1326, 7, 383, 1),
(1327, 6, 383, 1),
(1350, 1, 338, 1),
(1353, 6, 29103, 6),
(1358, 7, 29973, 3),
(1359, 6, 29973, 2),
(1368, 3, 338, 1),
(1373, 1, 28806, 5),
(1376, 3, 1929, 1),
(1390, 3, 29982, 1),
(1397, 2, 3281, 5),
(1427, 8, 12620, 1),
(1450, 7, 9936, 5),
(1472, 1, 1209, 1),
(1474, 47, 13083, 3),
(1477, 47, 30143, 1),
(1479, 47, 29480, 9),
(1482, 47, 30161, 9),
(1483, 47, 24839, 12),
(1485, 47, 30158, 1),
(1488, 47, 374, 5),
(1489, 47, 30116, 4),
(1490, 47, 30154, 1),
(1492, 47, 29606, 1),
(1494, 47, 30090, 2),
(1496, 47, 29033, 10),
(1498, 47, 20463, 1),
(1501, 47, 30180, 1),
(1504, 47, 11923, 1),
(1505, 47, 19188, 1),
(1506, 47, 30128, 1),
(1508, 47, 29871, 2),
(1509, 4, 11439, 4),
(1513, 7, 29982, 20),
(1514, 47, 30145, 1),
(1515, 47, 29983, 1),
(1516, 47, 11037, 2),
(1517, 47, 29692, 5),
(1520, 47, 29718, 6),
(1524, 47, 9182, 1),
(1526, 7, 30100, 5),
(1527, 6, 30100, 4),
(1528, 47, 18472, 2),
(1529, 42, 30202, 1),
(1530, 47, 4703, 1),
(1533, 47, 9630, 3),
(1535, 47, 6743, 2),
(1538, 47, 30151, 2),
(1542, 47, 30054, 1),
(1544, 47, 29962, 3),
(1546, 47, 29695, 1),
(1555, 47, 29934, 2),
(1558, 47, 29575, 3),
(1559, 47, 30224, 1),
(1560, 8, 29103, 1),
(1561, 6, 29982, 2),
(1562, 47, 30249, 1),
(1563, 47, 12914, 2),
(1564, 47, 21620, 3),
(1565, 47, 30263, 1),
(1566, 47, 10211, 5),
(1567, 47, 19277, 7),
(1568, 47, 30023, 2),
(1569, 47, 29607, 2),
(1570, 47, 17169, 1),
(1571, 47, 29490, 2),
(1572, 47, 30273, 1),
(1573, 47, 30275, 1),
(1574, 47, 12788, 1),
(1575, 47, 29639, 2),
(1576, 47, 30282, 1),
(1577, 47, 30134, 1),
(1578, 47, 11031, 1),
(1579, 47, 29523, 1),
(1580, 47, 30276, 1),
(1581, 47, 19262, 2),
(1582, 47, 12759, 2),
(1583, 47, 7720, 4),
(1584, 47, 5493, 1),
(1585, 47, 29873, 1),
(1586, 47, 30292, 1),
(1587, 47, 29489, 4),
(1588, 47, 30243, 4),
(1589, 47, 19888, 1),
(1590, 47, 30300, 1),
(1591, 47, 29484, 2),
(1592, 47, 29783, 2),
(1593, 47, 28378, 5),
(1594, 47, 280, 2),
(1595, 47, 29281, 2),
(1596, 47, 29894, 1),
(1597, 47, 30320, 1),
(1598, 47, 2402, 1),
(1599, 47, 7847, 1),
(1600, 42, 30319, 2),
(1601, 47, 101, 2),
(1602, 47, 12821, 5),
(1603, 47, 19311, 2),
(1604, 47, 30327, 1),
(1605, 47, 30329, 1),
(1607, 47, 29815, 1),
(1609, 47, 11128, 1),
(1610, 47, 30308, 1),
(1611, 47, 12820, 4),
(1612, 4, 18, 11),
(1614, 47, 29160, 2),
(1617, 47, 30287, 1),
(1618, 47, 30108, 1),
(1620, 47, 30310, 1),
(1621, 47, 30347, 1),
(1622, 47, 29600, 1),
(1625, 47, 2239, 1),
(1626, 47, 28853, 1),
(1627, 3, 1098, 1),
(1628, 47, 29092, 3),
(1632, 47, 28972, 2),
(1633, 47, 29722, 6),
(1634, 8, 29982, 1),
(1635, 47, 4029, 1),
(1636, 47, 29110, 1),
(1637, 47, 569, 2),
(1638, 47, 29081, 2),
(1639, 47, 29046, 1),
(1640, 47, 7083, 1),
(1641, 47, 9791, 1),
(1642, 47, 29515, 1),
(1643, 47, 7200, 1),
(1644, 47, 30384, 1),
(1649, 47, 10422, 1),
(1651, 47, 29574, 1),
(1654, 47, 30390, 3),
(1656, 47, 30356, 1),
(1657, 3, 18, 1),
(1659, 47, 30413, 1),
(1661, 47, 20958, 1),
(1663, 47, 30348, 2),
(1671, 47, 8471, 2),
(1672, 47, 19099, 1),
(1676, 47, 29508, 2),
(1691, 47, 331, 2),
(1693, 47, 10333, 2),
(1694, 47, 30157, 4),
(1695, 47, 6006, 1),
(1696, 47, 29657, 2),
(1697, 47, 4284, 1),
(1698, 47, 30405, 3),
(1699, 47, 13565, 6),
(1700, 47, 23206, 1),
(1701, 47, 30467, 2),
(1702, 47, 5325, 1),
(1703, 47, 29322, 1),
(1704, 47, 4102, 2),
(1705, 47, 30475, 2),
(1706, 47, 1365, 1),
(1707, 47, 30323, 2),
(1708, 47, 12833, 2),
(1709, 47, 1141, 2),
(1710, 47, 29416, 5),
(1711, 47, 29330, 3),
(1712, 47, 30496, 1),
(1713, 47, 14667, 1),
(1714, 47, 11789, 1),
(1715, 47, 30487, 3),
(1716, 47, 20706, 6),
(1719, 47, 29533, 2),
(1720, 47, 29224, 1),
(1732, 47, 30505, 1),
(1735, 47, 29570, 2),
(1738, 47, 30510, 11),
(1740, 47, 10007, 2),
(1742, 47, 29445, 1),
(1748, 47, 20352, 1),
(1751, 47, 4630, 1),
(1757, 47, 5828, 1),
(1758, 47, 21217, 13),
(1759, 47, 29358, 3),
(1760, 47, 29814, 1),
(1761, 47, 30548, 6),
(1762, 47, 30542, 2),
(1763, 47, 2620, 1),
(1764, 47, 11461, 2),
(1765, 47, 30549, 1),
(1766, 47, 7215, 1),
(1767, 47, 12598, 1),
(1768, 47, 30561, 1),
(1769, 47, 493, 1),
(1775, 47, 30567, 1),
(1776, 47, 30571, 2),
(1781, 47, 29614, 1),
(1784, 47, 820, 1),
(1786, 47, 30047, 3),
(1787, 4, 19097, 4),
(1788, 7, 30540, 2),
(1789, 6, 30540, 2),
(1794, 47, 30597, 4),
(1795, 47, 12904, 1),
(1796, 47, 9337, 1),
(1797, 47, 18858, 2),
(1798, 47, 29628, 3),
(1799, 47, 3755, 3),
(1800, 47, 30601, 3),
(1801, 47, 13555, 1),
(1802, 47, 12297, 2),
(1803, 47, 30512, 23),
(1804, 47, 30623, 1),
(1805, 47, 11200, 1),
(1806, 47, 29616, 3),
(1807, 47, 30639, 1),
(1808, 47, 831, 1),
(1809, 47, 30624, 1),
(1810, 47, 19240, 1),
(1811, 47, 30635, 1),
(1813, 47, 30647, 1),
(1820, 47, 9618, 1),
(1821, 47, 30655, 1),
(1822, 47, 29569, 2),
(1826, 47, 14927, 1),
(1831, 47, 29635, 1),
(1833, 47, 29725, 3),
(1835, 47, 28788, 1),
(1838, 4, 11437, 4),
(1840, 47, 11644, 1),
(1845, 47, 21864, 1),
(1846, 47, 12797, 2),
(1847, 47, 12810, 3),
(1849, 47, 19173, 2),
(1851, 47, 30683, 2),
(1852, 47, 288, 3),
(1853, 47, 29107, 2),
(1854, 47, 16274, 2),
(1931, 47, 30554, 1),
(1932, 47, 29174, 2),
(1933, 4, 11438, 1),
(1939, 47, 9676, 1),
(1940, 47, 737, 1),
(1941, 47, 29780, 1),
(1944, 47, 30670, 1),
(1950, 47, 10039, 1),
(1952, 47, 30675, 2),
(1992, 47, 23688, 1),
(2004, 47, 30794, 1),
(2018, 7, 11443, 1),
(2019, 6, 11443, 1),
(2023, 47, 303, 1),
(2024, 47, 30786, 1),
(2026, 47, 30829, 2),
(2027, 47, 30838, 2),
(2029, 47, 9745, 1),
(2030, 47, 80, 1),
(2036, 47, 30836, 1),
(2037, 47, 30239, 1),
(2038, 57, 29480, 10),
(2039, 47, 30861, 1),
(2040, 47, 21616, 1),
(2041, 47, 30863, 1),
(2042, 47, 29868, 1),
(2043, 47, 30860, 1),
(2044, 47, 29067, 1),
(2045, 47, 30874, 1),
(2046, 47, 30878, 7),
(2047, 47, 30888, 1),
(2048, 47, 10573, 2),
(2049, 47, 30837, 1),
(2050, 47, 29717, 2),
(2051, 47, 29742, 2),
(2052, 47, 204, 2),
(2053, 56, 4112, 1),
(2055, 47, 30905, 1),
(2057, 47, 4242, 1),
(2064, 56, 2491, 1),
(2065, 47, 12553, 1),
(2068, 47, 13544, 2),
(2071, 47, 30604, 1),
(2072, 56, 30920, 1),
(2073, 47, 30918, 1),
(2074, 47, 29342, 2),
(2076, 56, 30924, 1),
(2080, 47, 30928, 1),
(2081, 47, 11441, 2),
(2083, 47, 30931, 1),
(2085, 47, 30882, 1),
(2086, 47, 13350, 1),
(2087, 47, 18997, 1),
(2089, 56, 28812, 1),
(2090, 47, 30936, 1),
(2092, 47, 30924, 6),
(2096, 47, 30710, 1),
(2097, 47, 10380, 1),
(2099, 59, 10007, 1),
(2100, 47, 29640, 2),
(2101, 47, 9491, 3),
(2102, 47, 3099, 1),
(2103, 47, 30726, 4),
(2105, 47, 1343, 1),
(2112, 47, 5092, 1),
(2117, 47, 30117, 9),
(2121, 47, 29362, 2),
(2125, 47, 8745, 1),
(2126, 47, 29541, 4),
(2130, 47, 21887, 3),
(2131, 47, 30952, 1),
(2132, 47, 29447, 1),
(2134, 56, 3262, 1),
(2137, 47, 11865, 2),
(2140, 47, 30954, 3),
(2142, 47, 30205, 1),
(2143, 47, 4230, 1),
(2145, 47, 30991, 4),
(2148, 47, 31000, 1),
(2150, 47, 31004, 1),
(2152, 59, 28831, 2),
(2167, 57, 29160, 1),
(2168, 47, 31013, 1),
(2169, 47, 8213, 1),
(2170, 57, 7200, 3),
(2171, 47, 11131, 1),
(2185, 47, 31039, 3),
(2186, 3, 61, 4),
(2189, 47, 31043, 3),
(2190, 4, 29825, 1),
(2191, 4, 1209, 2),
(2192, 59, 9308, 1),
(2193, 47, 9308, 1),
(2195, 47, 31052, 1),
(2203, 47, 17424, 1),
(2208, 47, 31032, 1),
(2212, 47, 30947, 2),
(2215, 47, 29300, 6),
(2221, 47, 31073, 2),
(2225, 47, 30098, 1),
(2231, 57, 1096, 2),
(2232, 47, 10536, 2),
(2233, 47, 29240, 2),
(2234, 47, 22126, 2),
(2235, 47, 1940, 2),
(2236, 7, 12553, 8),
(2237, 6, 12553, 1),
(2238, 47, 29999, 2),
(2239, 47, 31096, 1),
(2240, 47, 31091, 2),
(2241, 47, 6746, 1),
(2242, 47, 30527, 1),
(2243, 47, 31076, 1),
(2244, 56, 29856, 1),
(2245, 47, 31084, 1),
(2246, 56, 1195, 1),
(2247, 47, 31068, 5),
(2248, 47, 29175, 1),
(2249, 47, 31108, 2),
(2250, 47, 30712, 1),
(2251, 47, 11774, 1),
(2252, 47, 316, 1),
(2253, 47, 29217, 4),
(2254, 56, 12728, 1),
(2255, 47, 31059, 1),
(2256, 47, 655, 1),
(2257, 47, 10097, 1),
(2258, 47, 31124, 2),
(2259, 47, 10550, 3),
(2260, 47, 31126, 1),
(2261, 47, 2548, 1),
(2262, 59, 13762, 1),
(2263, 47, 13762, 1),
(2264, 47, 1449, 1),
(2265, 47, 700, 2),
(2266, 47, 31029, 1),
(2267, 56, 31141, 1),
(2268, 66, 644, 1),
(2269, 47, 30797, 1),
(2270, 47, 30089, 1),
(2274, 47, 31048, 3),
(2276, 47, 31157, 1),
(2280, 47, 29317, 1),
(2281, 47, 3883, 1),
(2283, 47, 11116, 1),
(2284, 47, 3481, 1),
(2286, 47, 31164, 2),
(2287, 59, 30991, 1),
(2291, 47, 31145, 2),
(2293, 47, 30876, 1),
(2295, 47, 11793, 1),
(2296, 47, 31162, 2),
(2297, 47, 29349, 3),
(2298, 47, 9919, 1),
(2299, 47, 30813, 1),
(2300, 47, 1049, 1),
(2301, 47, 3429, 1),
(2302, 47, 12880, 1),
(2303, 47, 31188, 1),
(2304, 47, 4902, 2),
(2324, 47, 30553, 1),
(2327, 66, 31213, 1),
(2339, 47, 30213, 1),
(2433, 47, 31225, 3),
(2454, 47, 31226, 1),
(2456, 47, 31275, 1),
(2457, 47, 31283, 1),
(2458, 47, 11920, 1),
(2459, 47, 9587, 1),
(2460, 47, 11872, 1),
(2461, 1, 29982, 1),
(2462, 47, 11600, 1),
(2463, 47, 484, 1),
(2464, 47, 29812, 1),
(2465, 47, 30978, 1),
(2466, 47, 30207, 2),
(2467, 47, 31368, 1),
(2468, 47, 31297, 1),
(2469, 66, 31371, 1),
(2470, 47, 7718, 1),
(2471, 47, 31295, 1),
(2472, 47, 31387, 1),
(2473, 47, 31381, 2),
(2481, 42, 31225, 1);
/*!40000 ALTER TABLE `salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;