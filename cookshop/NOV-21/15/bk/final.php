<?php 
/*new*/
$file =  fopen('ordersample.csv', "r");	
$i = 0;	 

while ($row = fgetcsv($file)) { 
    if ($i > 0) {
    

$url = 'http://m2.cookshopplus.com/';
$token_url=$url."rest/V1/integration/admin/token";
$product_url=$url. "rest/V1/orders/create";
$ch = curl_init();
$data = array("username" => agila, "password" => "admin1234");
$data_string = json_encode($data);
$ch = curl_init($token_url);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
'Content-Type: application/json',
'Content-Length: ' . strlen($data_string))
);
$token = curl_exec($ch);

$adminToken= json_decode($token);
echo $adminToken;

$base_discount_amount=$row[1];
$base_grand_total = $row[2];
$base_shipping_amount = $row[3];
$base_subtotal1 = $row[4];
$base_subtotal = number_format("$base_subtotal1",2);
$base_tax_amount = $row[5];
$customer_email	= $row[6];
$customer_firstname =$row[7];
$customer_group	= $row[8];
$customer_id =$row[9];
$customer_is_guest = $row[10];
$customer_lastname	= $row[11];
$customer_note_notify = $row[12];
$discount_amount	= $row[13];
$email_sent	= $row[14];
$coupon_code	= $row[15];
$discount_description =$row[16];
$grand_total = $row[17];
$is_virtual	= $row[18];
$order_currency_code =$row[19];
$shipping_amount	= $row[20];
$shipping_description = $row[21];
$state	= $row[22];
$status = $row[23];
$store_currency_code	= $row[24];
$store_id	= $row[25];
$store_name	= $row[26];
$subtotal1	= $row[27];
$subtotal = number_format("$subtotal1",2);
$subtotal_incl_tax1	= $row[28];
$subtotal_incl_tax = number_format("$subtotal_incl_tax1",2);

$tax_amount	= $row[29];
$total_item_count	= $row[30];
$total_qty_ordered	= $row[31];
$weight	= $row[32];
$city	= $row[33];
$company	= $row[34];
$country	= $row[35];
$email	= $row[36];
$firstname	= $row[37];
$lastname	= $row[38];
$postcode	= $row[39];
$region	= $row[40];
$region_code	= $row[41];
$region_id	= $row[42];
$street1	= $row[43];
$street2	= $row[44];
$telephone	= $row[45];
$product_id	= $row[46];
$product_qty	= $row[47];
$product_price	= $row[48];
$shipments_data	= $row[49];
$product_ids	= $row[50];
$product_name	= $row[51];
/*new*/

// exit();
include("$_SERVER[DOCUMENT_ROOT]/config/config.inc.php");
include("$_SERVER[DOCUMENT_ROOT]/init.php");
echo "TEST";

// Your order id

// // $id_order = 235;
// $servername = "207.7.94.147";
// $username = "ulamart_newlive";
// $password = "Qe&+EAmUugih";
// $dbname = "ulamart_livep1";

    /* ORDER */
    $sampleOrderData=array (
                    'base_currency_code' => "$store_currency_code",
                    'base_discount_amount' => $base_discount_amount,
                    'base_grand_total' => $base_grand_total,
                    'base_shipping_amount' => $base_shipping_amount,
                    'base_subtotal' => $base_subtotal,
                    'base_tax_amount' => $base_tax_amount,
                    'customer_email' => $customer_email,
                    'customer_firstname' => $customer_firstname,
                    'customer_lastname' => $customer_lastname,
                    'customer_group_id' => $customer_group,
                    'customer_id' => $customer_id,
                    'customer_is_guest' => $customer_is_guest,
                    'customer_note_notify' => 1,
                    'discount_amount' => $discount_amount,
                    'email_sent' => 0,
                    'coupon_code' => '',
                    'discount_description' => '',
                    'grand_total' => $grand_total,
                    'is_virtual' => $is_virtual,
                    'order_currency_code' => "$order_currency_code",
                    'shipping_amount' => $shipping_amount,
                    'shipping_description' => "$shipping_description",
                    'state' => "$state",
                    'status' => "$status",
                    'store_currency_code' => "$store_currency_code",
                    'store_id' => $store_id,
                    'store_name' => 'Main Website
                    Main Website Store',
                    'subtotal' => $subtotal,
                    'subtotal_incl_tax' => $subtotal_incl_tax,
                    'tax_amount' => $tax_amount,
                    'total_item_count' => $total_item_count,
                    'weight' => $weight);


        $total_qty_ord = 0;
        $sampleOrderData['items'][] = array (
                        'base_discount_amount' => $base_discount_amount,
                        'base_original_price' => $product_price,
                        'base_price' => $product_price,
                        'base_price_incl_tax' => $product_price,
                        'base_row_invoiced' => '0.0',
                        'base_row_total' => $product_price,
                        'base_tax_amount' => 0,
                        'base_tax_invoiced' => 0,
                        'discount_amount' => $base_discount_amount,
                        'discount_percent' => 0,
                        'free_shipping' => 0,
                        'is_virtual' => 0,
                        'name' => $product_name,
                        'original_price' => $product_price,
                        'price' => $product_price,
                        'price_incl_tax' => $product_price,
                        'product_id' => $product_ids,
                        'product_type' => 'simple',
                        'qty_ordered' => $product_qty,
                        'row_total' => $product_price,
                        'row_total_incl_tax' =>  $product_price,
                        'sku' =>$product_id,
                        'store_id' => $store_id,
                      );
        $total_qty_ord = $total_qty_ord + $product_qty;

        //echo 'TOTAL QTY ORDERED: '.$total_qty_ord;
	$sampleOrderData['total_qty_ordered'] = $total_qty_ordered; //$total_qty_ord;
	/* PRODUCT */
	/* CUSTOMER */
        $sampleOrderData['billing_address'] = 
                    array (
                      'address_type' => 'billing',
                      'city' => $city ,
                      'company' => '',
                      'country_id' => "$country",
                      'email' => $customer_email,
                      'firstname' => $customer_firstname,
                      'lastname' => $customer_lastname,
                      'postcode' => $postcode,
                      'street' => 
                      array (
                        0 =>  $street1,
                        1 =>  $street2,
                      ),
                      'telephone' => $telephone,
                    );
        $sampleOrderData['payment'] =
                    array (
                      'method' => 'cashondelivery',
                    );
        $sampleOrderData['extension_attributes'] =
                    array (
                      'shipping_assignments' => 
                      array (
                        0 => 
                        array (
                          'shipping' => 
                          array (
                            'address' => 
                            array (
                              'address_type' => 'shipping',
                              'city' => $city,
                              'company' => '',
                              'country_id' => "$country",
                              'email' => $customer_email,
                              'firstname' => $customer_firstname,
                              'lastname' => $customer_lastname,
                              'postcode' => $postcode,
                              'street' => 
                              array (
                                0 =>  $street1,
                                1 => $street2,
                              ),
                              'telephone' => $telephone,
                            ),
                            'method' => 'ups_01',
                          ),
                        ),
                      ),
                    );
        /* SHIPPING */
            echo "<pre>";
            print_r($sampleOrderData);
            echo "</pre>";
            // exit();
        
        // $conn->close();

        $orderData = json_encode(array('entity' => $sampleOrderData));

        $setHaders = array('Content-Type:application/json','Authorization:Bearer '.$adminToken);

$ch = curl_init();
curl_setopt($ch,CURLOPT_URL, $product_url);
curl_setopt($ch,CURLOPT_POSTFIELDS, $orderData);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
curl_setopt($ch, CURLOPT_HTTPHEADER, $setHaders); 
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);  
print_r($response);


    if ($err) {
      echo "cURL Error #:" . $err;
      } else {
      echo $i;
      echo "<br>";
      } 
  }
  $i++;
}
