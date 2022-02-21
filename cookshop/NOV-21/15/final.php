<?php 

$url = 'http://magento2.ulamart.com/';
$token_url=$url."rest/V1/integration/admin/token";
$product_url=$url. "rest/V1/orders/create";
$ch = curl_init();
$data = array("username" => 'ulamart', "password" => 'Ulamart123');
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
$adminToken=  json_decode($token);;
echo $adminToken;
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

$servername = "localhost";
$username = "ulamart_newlive";
$password = 'Qe&+EAmUugih';
$dbname = "ulamart_live_order_migration2";


// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
echo "connection succesfull";
// exit();
$sql_query="Select id_order FROM ps_orders WHERE id_order > 4743 and id_order < 5000 ORDER BY id_order ASC limit 1000";

$qu = $conn->query($sql_query);
// $order_id = $qu->fetch_assoc();
// print_r($qu);
if ($qu->num_rows > 0) {
  // output data of each row
  while($order_id = $qu->fetch_assoc()) {
    $or_id=$order_id["id_order"];
    echo $or_id;
    if($or_id>=4743 && $or_id<=5000){
    echo "id: " .$or_id. "<br>";
//     }
//   }
// }
// exit();
$id_order = $or_id;
// if()

// Load order object
$order = new Order((int) $id_order);

// Validate customer object
if (Validate::isLoadedObject($order)) {
   
	// Print Order Object
	echo "<pre>";
	//  print_r($order);
	echo "</pre>";
	// $order=new Order($id_order);
    $products=$order->getProducts();
    echo "<pre>";
  // print_r($products);
    echo "</pre>";
  $customer = new Customer($order->id_customer);
	$customer_address = new Address($order->id_address_delivery);
  // print_r($customer);
  $customer_addr1=$customer_address->address1;
  $customer_addr2=$customer_address->address2;
  $customer_city=$customer_address->city;
  $customer_pin=$customer_address->postcode;
  $customer_phone=$customer_address->phone;

    $customer_email= $customer->email;
    echo $customer_email;
    if($customer_email != 'pub@prestashop.com'){
      echo $customer_email;
    $cus_fname=$customer->firstname;
    $cus_lname=$customer->lastname;
    // echo $cus_lname;
    
    $sql2="Select customer_id,email FROM customer_entity WHERE email LIKE '".$customer_email."'LIMIT 1";
    $rs = $conn->query($sql2);
    $row2 = $rs->fetch_assoc();
    
    print_r($row2);
    $cus_id = $row2['customer_id'];
    $cus_email = $row2['email'];
    /* ORDER */
    $sampleOrderData=array (
                    'base_currency_code' => 'INR',
                    'base_discount_amount' => $order->total_discounts,
                    'base_grand_total' => $order->total_paid,
                    'base_shipping_amount' => $order->total_shipping,
                    'base_subtotal' => $order->total_paid_tax_incl,
                    'base_tax_amount' => 0,
                    'customer_email' => $cus_email,
                    'customer_firstname' => $cus_fname,
                    'customer_lastname' => $cus_lname,
                    'customer_group_id' => 1,
                    'customer_id' => $cus_id,
                    'customer_is_guest' => 0,
                    'customer_note_notify' => 1,
                    'discount_amount' => 0,
                    'email_sent' => 0,
                    'coupon_code' => '',
                    'discount_description' => '',
                    'grand_total' => $order->total_paid_tax_incl,
                    'is_virtual' => 0,
                    'order_currency_code' => 'INR',
                    'shipping_amount' => 5,
                    'shipping_description' => 'Flat Rate - Fixed',
                    'state' => 'new',
                    'status' => 'complete',
                    'store_currency_code' => 'INR',
                    'store_id' => 1,
                    'store_name' => 'Main Website
                    Main Website Store',
                    'subtotal' => $order->total_paid,
                    'subtotal_incl_tax' => $order->total_paid_tax_incl,
                    'tax_amount' => 0,
                    'total_item_count' => 1,
                    'weight' => 2);
    /* ORDER */
    /* PRODUCT */
    $total_qty_ord = 0;
	foreach($products as $product_detail => $val){
        $checkprname=$val['product_name'];
        echo $checkprname;
        
        $sql="Select product_id,product_sku,product_name FROM catalog_product_entity_new WHERE product_name LIKE '".$checkprname."'";
        $sqlresult = $conn->query($sql);
        // print_r($sqlresult);
        $row = $sqlresult->fetch_assoc();
      print_r($row);
      // exit();

        $sampleOrderData['items'][] = array (
                        'base_discount_amount' => $order->total_discounts,
                        'base_original_price' => $val["product_price"],
                        'base_price' => $val["product_price"],
                        'base_price_incl_tax' => $val["total_wt"],
                        'base_row_invoiced' => '0.0',
                        'base_row_total' => $val["product_price"],
                        'base_tax_amount' => 0,
                        'base_tax_invoiced' => 0,
                        'discount_amount' => $order->total_discounts,
                        'discount_percent' => 0,
                        'free_shipping' => 0,
                        'is_virtual' => 0,
                        'name' => $row["product_name"],
                        'original_price' => $val["product_price"],
                        'price' => $val["product_price"],
                        'price_incl_tax' => $val["total_price_tax_incl"],
                        'product_id' => $row["product_id"],
                        'product_type' => 'simple',
                        'qty_ordered' => $val["product_quantity"],
                        'row_total' => $val["total_price"],
                        'row_total_incl_tax' =>  $val["total_wt"],
                        'sku' =>$row["product_sku"],
                        'store_id' => 1,
                      );
        $total_qty_ord = $total_qty_ord + $val["product_quantity"];
	}
	//echo 'TOTAL QTY ORDERED: '.$total_qty_ord;
	$sampleOrderData['total_qty_ordered'] = $total_qty_ord;
	/* PRODUCT */
	/* CUSTOMER */
        $sampleOrderData['billing_address'] = 
                    array (
                      'address_type' => 'billing',
                      'city' => $customer_city,
                      'company' => '',
                      'country_id' => 'IN',
                      'email' => $cus_email,
                      'firstname' => $cus_fname,
                      'lastname' => $cus_lname,
                      'postcode' => $customer_pin,
                      'street' => 
                      array (
                        0 =>  $customer_addr1,
                        1 =>  $customer_addr2,
                      ),
                      'telephone' => $customer_phone,
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
                              'city' => $customer_city,
                              'company' => '',
                              'country_id' => 'IN',
                              'email' => $cus_email,
                              'firstname' => $cus_fname,
                              'lastname' => $cus_lname,
                              'postcode' => $customer_pin,
                              'street' => 
                              array (
                                0 =>  $customer_addr1,
                                1 => $customer_addr2,
                              ),
                              'telephone' => $customer_phone,
                            ),
                            'method' => 'flatrate_flatrate',
                          ),
                        ),
                      ),
                    );
        /* SHIPPING */
            echo "<pre>";
            print_r($sampleOrderData);
            echo "</pre>";
        
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


// if ($err) {
  // echo "cURL Error #:" . $err;
// } else {
  // echo "<pre>";
  echo $response;
  $jsonresponse =json_decode($response);
    $magento_id=$jsonresponse->increment_id;
    $sql = "INSERT INTO order_ids_new (presta_id, magento_id) VALUES ('$id_order', '$magento_id')";
    
    if ($conn->query($sql) === TRUE) {
      echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
  // echo "</pre>";
// }
}

}
}
}
} else {
  echo "0 results";
}