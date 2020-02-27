<?php


namespace controller;


use model\db\CartModelDb;
use model\db\WishModelDb;

class HeadInfo
{
    public function cartInfo()
    {
        $cart = new CartModelDb();
        if(isset($_SESSION['user_id'])){
            $cart_data['main'] = $cart->getCart($_SESSION['user_id']);
            count($cart_data['main']) == 1 ? $cart_data['count_item'] = '(' . 1 . ' item)' : $cart_data['count_item'] =
                '(' . count($cart_data['main']) . ' items)';

            foreach ($cart_data['main'] as $value){
                $cart_data['sum'] += $value['price'];
            }
            $cart_data['sum'] = '$' . number_format($cart_data['sum'], 1, '.', '');
        } else {
            $cart_data['sum'] = '$' . 0;
            $cart_data['count_item'] = '('. 0 . ' items)';
            }

        return $cart_data;
    }

    public function wishInfo()
    {
        $wish = new WishModelDb();
        $wish_data['main'] = $wish->getWish($_SESSION['user_id']);
        $wish_data['count'] = count($wish_data['main']);
        return $wish_data;
    }
}