<!DOCTYPE html>
<html {if $language->href_lang}lang="{$language->href_lang|escape}"{/if} prefix="og: http://ogp.me/ns#">
<head>
    {* Full base address *}
    <base href="{$config->root_url}/">
    {* preload *}
    <link rel="dns-prefetch" href="//fonts.googleapis.com">
    <link rel="dns-prefetch" href="//use.fontawesome.com">
    <link rel="dns-prefetch" href="//www.google-analytics.com"> 
    <link rel="dns-prefetch" href="//www.googletagmanager.com"> 
    <link rel="preload" as="style" href="design/{$settings->theme|escape}/css/okay.css?v=7">
    <link rel="preload" as="style" href="design/{$settings->theme|escape}/css/media.css?v=3">
    <link rel="preload" as="style" href="design/{$settings->theme|escape}/css/modal.css">
    <link rel="preload" as="style" href="design/{$settings->theme|escape}/css/custom.css">
    <link rel="preload" as="script" href="design/{$settings->theme}/js/jquery-2.1.4.min.js">
    {* Title *}
    <title>{$meta_title|escape}{$filter_meta->title|escape}</title>
    {* Meta tags *}
{literal}
  <!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-M65VKQT4');</script>
<!-- End Google Tag Manager -->
<script type="text/javascript">
    (function(c,l,a,r,i,t,y){
        c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
        t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
        y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
    })(window, document, "clarity", "script", "kz22jycziw");
</script>
{/literal}

  


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    {if (!empty($meta_description) || !empty($meta_keywords) || !empty($filter_meta->description) || !empty($filter_meta->keywords)) && !$smarty.get.page}
        <meta name="description" content="{$meta_description|escape}{$filter_meta->description|escape}">
    {/if}
    {if $module == 'ProductsView'}
        {if $set_canonical}
            <meta name="robots" content="noindex,nofollow">
        {elseif $smarty.get.page || $smarty.get.sort}
            <meta name="robots" content="noindex,follow">
        {elseif isset($smarty.get.keyword)}
            <meta name="robots" content="noindex,follow">
        {else}
            <meta name="robots" content="index,follow">
        {/if}
    {elseif $smarty.get.module == "RegisterView" || $smarty.get.module == "LoginView" || $smarty.get.module == "UserView" || $smarty.get.module == "CartView"}
        <meta name="robots" content="noindex,follow">
    {elseif $smarty.get.module == "OrderView"}
        <meta name="robots" content="noindex,nofollow">
    {else}
        <meta name="robots" content="index,follow">
    {/if}
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    {if $settings->g_webmaster}
        <meta name="google-site-verification" content="{$settings->g_webmaster}">
    {/if}
    {if $settings->y_webmaster}
        <meta name='yandex-verification' content="{$settings->y_webmaster}">
    {/if}
    {* rel prev next для блога *}
    {if $smarty.get.module == "BlogView" && $total_pages_num > 1}
        {if $current_page_num == $total_pages_num}
            {if $current_page_num == 2}
                <link rel="prev" href="{url page=null}"/>
            {else}
                <link rel="prev" href="{url page=$current_page_num-1}"/>
            {/if}
        {elseif $current_page_num == 1}
            <link rel="next" href="{url page=2}"/>
        {else}
            {if $current_page_num == 2}
                <link rel="prev" href="{url page=null}"/>
            {else}
                <link rel="prev" href="{url page=$current_page_num-1}"/>
            {/if}
            <link rel="next" href="{url page=$current_page_num+1}"/>
        {/if}
    {/if}
    {* rel prev next для каталога товаров *}
    {$rel_prev_next}

    {if $module == 'ProductView'}
        {$canonical="/products/{$product->url}" scope=parent}
    {elseif $module == 'ProductsView'}
        {* The canonical address of the page *}
        {if $set_canonical || $self_canonical}
            {if $category}
                {$canonical="/catalog/{$category->url}" scope=parent}
            {elseif $brand}
                {$canonical="/brands/{$brand->url}" scope=parent}
            {elseif $page->url=='discounted'}
                {$canonical="/discounted" scope=parent}
            {elseif $page->url=='bestsellers'}
                {$canonical="/bestsellers" scope=parent}
            {elseif $keyword}
                {$canonical="/all-products" scope=parent}
            {else}
                {$canonical="/all-products" scope=parent}
            {/if}
        {/if}
    {elseif $module == 'MainView'}
        {$canonical="" scope=parent}
    {/if}



    {* Product image/Post image for social networks *}
    {if $module == 'ProductView'}
        <meta property="og:url" content="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
        <meta property="og:type" content="article">
        <meta property="og:title" content="{$product->name|escape}">
        <meta property="og:description" content='{$product->annotation|strip_tags}'>
        <meta property="og:image" content="{$product->image->filename|resize:330:300}">
        <link rel="image_src" href="{$product->image->filename|resize:330:300}">
        {*twitter*}
        <meta name="twitter:card" content="summary">
        <meta name="twitter:title" content="{$product->name|escape}">
        <meta name="twitter:description" content="{$product->annotation|strip_tags}">
        <meta name="twitter:image" content="{$product->image->filename|resize:330:300}">
    {elseif $module == 'BlogView'}
        <meta property="og:url" content="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
        <meta property="og:type" content="article">
        <meta property="og:title" content="{$post->name|escape}">
        {if $post->image}
            <meta property="og:image" content="{$post->image|resize:400:300:false:$config->resized_blog_dir}">
            <link rel="image_src" href="{$post->image|resize:400:300:false:$config->resized_blog_dir}">
        {else}
            <meta property="og:image" content="{$config->root_url}/design/{$settings->theme}/images/{$settings->site_logo}">
            <meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme}/images/{$settings->site_logo}">
        {/if}
        <meta property="og:description" content='{$post->annotation|strip_tags}'>
        {*twitter*}
        <meta name="twitter:card" content="summary">
        <meta name="twitter:title" content="{$post->name|escape}">
        <meta name="twitter:description" content="{$post->annotation|strip_tags}">
        <meta name="twitter:image" content="{$post->image|resize:400:300:false:$config->resized_blog_dir}">
    {else}
        <meta property="og:title" content="Інтернет-магазин ELALIZA ❤️ Жіночі сумки, одяг, аксесуари,елаліза,элализа">
        <meta property="og:type" content="website">
        <meta property="og:url" content="{$config->root_url}">
        <meta property="og:image" content="{$config->root_url}/design/{$settings->theme}/images/{$settings->site_logo}">
        <meta property="og:site_name" content="{$settings->site_name|escape}">
        <meta property="og:description" content="{$meta_description|escape}">
        <link rel="image_src" href="{$config->root_url}/design/{$settings->theme}/images/{$settings->site_logo}">
        {*twitter*}
        <meta name="twitter:card" content="summary">
        <meta name="twitter:title" content="{$settings->site_name|escape}">
        <meta name="twitter:description" content="{$meta_description|escape}">
        <meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme}/images/{$settings->site_logo}">
    {/if}
    {* The canonical address of the page *}
    {if isset($canonical)}
        <link rel="canonical" href="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
    {elseif $smarty.get.sort || $smarty.get.page}
        <link rel="canonical" href="{$sort_canonical}">
    {/if}
    {* Language attribute *}
    {if $show_alternate}
        {foreach $languages as $l}
            {if $l->enabled}
                <link rel="alternate" hreflang="{$l->href_lang}" href="{$config->root_url}/{$l->url}">
            {/if}
        {/foreach}
    {/if}
    {* Favicon *}
    <link href="design/{$settings->theme}/images/favicon.ico" type="image/x-icon" rel="icon">
    <link href="design/{$settings->theme}/images/favicon.ico" type="image/x-icon" rel="shortcut icon">  
    {* Fonts *}
    {if $is_lighthouse}
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i&amp;subset=cyrillic&amp;font-display=swap" rel="stylesheet">
  	<link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet"> 
    {/if}
    {* CSS *}
    <link href="design/{$settings->theme|escape}/css/okay.css" rel="stylesheet">
    <link href="design/{$settings->theme|escape}/css/media.css" rel="stylesheet">
  	<link href="design/{$settings->theme|escape}/css/modal.css" rel="stylesheet">
  	<link href="design/{$settings->theme|escape}/css/custom.css" rel="stylesheet">
    {if $is_lighthouse}
        {if $settings->head_custom_script}
            {$settings->head_custom_script}
        {/if}
    {/if}
    <script src="design/{$settings->theme}/js/jquery-2.1.4.min.js"></script>
    <script src="design/{$settings->theme}/js/lazy.min.js"></script>
  {literal}
    <!-- Meta Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '1065960241330095');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1065960241330095&ev=PageView&noscript=1"
/></noscript>
<!-- End Meta Pixel Code -->
{/literal}

  {if $smarty.get.module == "ProductView" || $smarty.get.module == "ProductsView" || $smarty.get.module == "MainView"}
    <script>
        $(document).ready(function() {
            // Проверяем количество вариантов
            if ($('.product_variants input[name="variant"]').length === 1) {
                var variant = $('.product_variants input[name="variant"]').val();
                var price = $('.product_variants input[name="variant"]').data('price');

                // Отправляем событие ViewContent для единственного варианта
                fbq('track', 'ViewContent', {
                    content_ids: variant,
                    content_type: 'product',
                    value: price,
                    currency: 'UAH'
                });
            }
        });

        $(document).on('submit', '.fn_variants', function(e) {
            var variant, price;

            // Проверяем выбранный вариант
            if ($('.product_variants input[name="variant"]:checked').length > 0) {
                variant = $('.product_variants input[name="variant"]:checked').val();
                price = $('.product_variants input[name="variant"]:checked').data('price');
            } else if ($('.product_variants input[name="variant"]').length === 1) {
                // Если есть только один вариант и он скрыт
                variant = $('.product_variants input[name="variant"]').val();
                price = $('.product_variants input[name="variant"]').data('price');
            }


            // Отправляем событие AddToCart в Facebook Pixel
            fbq('track', 'AddToCart', {
                content_ids: variant,
                content_type: 'product',
                value: price,
                currency: 'UAH'
            });
        });
    </script>
{/if}

{if $smarty.get.module == "BlogView" && $post}
    <script>
        fbq('track', 'ViewContent', {
            content_ids: '',
            content_type: 'article'
        });
    </script>
{/if}

{if $smarty.get.module == "CartView"}
    <script>
        fbq('track', 'InitiateCheckout', {
            content_ids: [{foreach $cart->purchases as $purchase}'{$purchase->variant->id}'{if !$purchase@last},{/if}{/foreach}],
            value: '{$cart->total_price}',
            content_type: 'product',
            currency: 'UAH',
            num_items:'{$cart->total_products}'
        });
    </script>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
{/if}

{if $smarty.get.module == 'OrderView'}
    <script>
        fbq('track', 'Purchase', {
            content_ids: [{foreach $purchases as $purchase}'{$purchase->variant->id}'{if !$purchase@last},{/if}{/foreach}],
            value: '{$order->total_price}',
            content_type: 'product',
            currency: 'UAH',
        });
    </script>
{/if}
</head>
<body>
    {literal}
 <!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M65VKQT4"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

{/literal}
    {if $is_lighthouse}
    {literal} 
   {/literal}
   {/if}
<style>

    body {
    background-color: #fff;
    color: #3d3a38;
    font-family: 'Manrope',sans-serif;
    font-size: 14px;
    font-weight: 400;
    letter-spacing: normal;
    line-height: normal;
    height: 100%;
    height: -webkit-fill-available;
    margin: 0;
}
/*
@font-face {
    font-family: Cera Pro;
    src: url(design/ELALIZA/font/CeraPro-Light.eot);
    src: url(design/ELALIZA/font/CeraPro-Light.eot?#iefix) format("embedded-opentype"), url(design/ELALIZA/font/CeraPro-Light.woff2) format("woff2"), url(design/ELALIZA/font/CeraPro-Light.woff) format("woff"), url(design/ELALIZA/font/CeraPro-Light.ttf) format("truetype"), url(design/ELALIZA/font/CeraPro-Light.svg#CeraPro-Light) format("svg");
    font-weight: 300;
    font-style: "normal";
    font-display: swap;
}
@font-face {
    font-family: Cera Pro;
    src: url(design/ELALIZA/font/CeraPro-Regular.eot);
    src: url(design/ELALIZA/font/CeraPro-Regular.eot?#iefix) format("embedded-opentype"), url(design/ELALIZA/font/CeraPro-Regular.woff2) format("woff2"), url(design/ELALIZA/font/CeraPro-Regular.woff) format("woff"), url(design/ELALIZA/font/CeraPro-Regular.ttf) format("truetype"), url(design/ELALIZA/font/CeraPro-Regular.svg#CeraPro-Regular) format("svg");
    font-weight: 400;
    font-style: "normal";
    font-display: swap;
}
@font-face {
    font-family: Cera Pro;
    src: url(design/ELALIZA/font/CeraPro-Medium.eot);
    src: url(design/ELALIZA/font/CeraPro-Medium.eot?#iefix) format("embedded-opentype"), url(design/ELALIZA/font/CeraPro-Medium.woff2) format("woff2"), url(design/ELALIZA/font/CeraPro-Medium.woff) format("woff"), url(design/ELALIZA/font/CeraPro-Medium.ttf) format("truetype"), url(design/ELALIZA/font/CeraPro-Medium.svg#CeraPro-Medium) format("svg");
    font-weight: 500;
    font-style: "normal";
    font-display: swap;
}
@font-face {
    font-family: Cera Pro;
    src: url(design/ELALIZA/font/CeraPro-Bold.eot);
    src: url(design/ELALIZA/font/CeraPro-Bold.eot?#iefix) format("embedded-opentype"), url(design/ELALIZA/font/CeraPro-Bold.woff2) format("woff2"), url(design/ELALIZA/font/CeraPro-Bold.woff) format("woff"), url(design/ELALIZA/font/CeraPro-Bold.ttf) format("truetype"), url(design/ELALIZA/font/CeraPro-Bold.svg#CeraPro-Bold) format("svg");
    font-weight: 700;
    font-style: "normal";
    font-display: swap;
}
@font-face {
    font-family: ALS Alumna;
    src: url(design/ELALIZA/font/ALSAlumna-Regular.eot);
    src: url(design/ELALIZA/font/ALSAlumna-Regular.eot?#iefix) format("embedded-opentype"), url(design/ELALIZA/font/ALSAlumna-Regular.woff2) format("woff2"), url(design/ELALIZA/font/ALSAlumna-Regular.woff) format("woff"), url(design/ELALIZA/font/ALSAlumna-Regular.ttf) format("truetype"), url(design/ELALIZA/font/ALSAlumna-Regular.svg#ALSAlumna-Regular) format("svg");
    font-weight: 400;
    font-style: "normal";
    font-display: swap;
}
*/
@font-face {
  font-family: 'Manrope';
  src: url('design/ELALIZA/fonts/manrope/Manrope-Regular.woff2') format('woff2'),
       url('design/ELALIZA/fonts/manrope/Manrope-Regular.woff') format('woff');
  font-weight: 400;
  font-style: normal;
  font-display: swap;
}

@font-face {
  font-family: 'Manrope';
  src: url('design/ELALIZA/fonts/manrope/Manrope-Bold.woff2') format('woff2'),
       url('design/ELALIZA/fonts/manrope/Manrope-Bold.woff') format('woff');
  font-weight: 700;
  font-style: normal;
  font-display: swap;
}

/* Добавьте аналогичные правила для остальных весов шрифта, меняя пути и font-weight */

    .header{
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    /*height: 44px;*/
    left: 0;
    letter-spacing: normal;
    line-height: normal;
    position: sticky;
    position: absolute;
    top: 0;
    transform: translateZ(0);
    transition: top .3s ease;
    width: 100%;
    z-index: 100;
}
.header__frame{
    box-sizing: border-box;
    height: 100%;
    padding: 0 16px;
    position: relative;
    width: 100%;
}
.header--white{
    position: fixed !important;
}
.header--white .header__frame:after, .header--white .header__frame:before {
    transition-delay: 0ms;
    width: 0;
}
.header__frame:before {
    left: 0;
}
.header--white .header__background {
    opacity: 1;
}

.header__inner path{
    fill: white;
}
.header--white path {
    fill: #a982a4;
}
.header__background{
    background-color: #fff;
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    opacity: 0;
}
.header__inner{
    height: 100%;
    position: relative;
}
.header__icons--left{
    left: 0;
}
.header__icons{
    font-size: 0;
    height: 24px;
    margin: -12px -8px;
    position: absolute;
    top: 50%;
}
.header-icon{
    cursor: pointer;
    display: inline-block;
    height: 24px;
    margin: 0 8px;
    position: relative;
    transform: translateZ(0);
    vertical-align: middle;
    width: 24px;
}
.header__logotype{
    width: 100%;
    margin: 0 auto;
    text-align: center;
}
.header__icons--right{
    right: 0;
}
.icon__layer{
    bottom: 0;
    display: block;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
}
.counter--white{
    background-color: #fff;
}
.counter{
    border-radius: 7px;
    bottom: 100%;
    display: inline-block;
    left: 100%;
    margin-bottom: -7px;
    margin-left: -7px;
    min-width: 14px;
    position: absolute;
    text-align: center;
    white-space: nowrap;
    border: 1px solid #f00;
}
.counter--white .counter__label{
    color: #d52b2b;
}
.counter__label{
    display: inline-block;
    font-size: 10px;
    line-height: 12px;
    padding: 1px 4px;
}
.menu_popup_visible{
    transform: translate(0) !important;
    visibility: visible !important;
}
.menu__popup{
    background-color: #fff;
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    height: 100%;
    left: 0;
    position: fixed;
    right: 0;
    top: 0;
    transform: translate(-105%);
    transition: transform .5s ease-in-out,visibility .5s linear;
    visibility: hidden;
    z-index: 100;
    -webkit-touch-action: none;
    touch-action: none;
}
.menu__popup:before {
    content: "";
    position: fixed;
    width: 100%;
    height: 200%;
    top: 0;
    left: 0;
    background-color: #fff;
}
.menu__scroll{
    height: 100%;
    left: 0;
    overflow: hidden;
    overflow-y: auto;
    position: absolute;
    top: 0;
    width: 100%;
}
.menu__inner--with-app{
    padding-bottom: 160px;
}
.menu__inner{
    box-sizing: border-box;
    min-height: 100%;
    padding-bottom: 80px;
    position: relative;
}
.menu__header{
    background-color: #fff;
    box-sizing: border-box;
    height: 44px;
    padding: 8px 16px;
    position: sticky;
    top: 0;
    z-index: 5;
}
.menu__close{
    cursor: pointer;
    height: 24px;
    left: 28px;
    margin: -12px;
    position: absolute;
    top: 50%;
    width: 24px;
}
.icon--main{
    fill: #887569;
}
.icon{
    display: block;
    height: 100%;
    -o-object-fit: contain;
    object-fit: contain;
    position: relative;
    stroke: none;
    transition: fill .3s ease;
    width: 100%;
}
.menu__content{
    position: relative;
}
.menu{
    padding: 4px 0;
}
.menu-item{
    display: block;
    position: relative;
    border-bottom: 1px solid #ebe6e1;
}

.menu-item__link{
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    align-items: center;
    box-sizing: border-box;
    color: #a982a4;
    cursor: pointer;
    display: flex;
    height: 36px;
    padding: 6px 16px;
    position: relative;
    text-decoration: none;
    white-space: nowrap;
    width: 100%;
}
.menu-item__link--primary{
    height: 44px;
    padding: 8px 36px 8px 16px;
}
.menu-item__link--sticky{
    background-color: #fff;
    position: sticky;
    top: 44px;
    z-index: 1;
}
.menu-item__link--sticky:after {
    background-color: #ebe6e1;
    content: "";
    display: block;
    height: 1px;
    left: 0;
    opacity: 0;
    position: absolute;
    top: 100%;
    transition: opacity .5s linear;
    width: 100%;
}
.menu-item__label{
    display: block;
    overflow: hidden;
    text-overflow: ellipsis;
    vertical-align: middle;
}
.menu-item__arrow{
    cursor: pointer;
    height: 24px;
    margin: -11px -14px;
    position: absolute;
    right: 24px;
    top: 50%;
    transition: transform .3s ease;
    width: 24px;
}
.menu__subscribe{
    position: relative;
    margin: 80px 0 24px;
    padding: 0 16px;
}
.slide__image{
    -webkit-border-radius: 1px;
    display: block;
    height: 100%;
    -o-object-fit: cover;
    object-fit: cover;
    -o-object-position: 50% 20%;
    object-position: 50% 20%;
    position: relative;
    width: 100%;
}
.no-padding{
    padding-left: 0px !important;
    padding-right: 0px !important;
}
a { 
    text-decoration: none;
   }
.selected .menu-item__link--sticky{
    background-color: #f1f1f1;
}
.collectionGrid-header .block.align-left {
    text-align: left;
}
.block {
    display: block;
    float: left;
    position: relative;
    vertical-align: top;
}
.s1 {
    float: none;
    width: 100%;
}
@media screen and (max-width: 549px){
    .collectionGrid-header h2 {
        line-height: 16px;
        margin-bottom: 16px;
    }
    .collectionGrid-link {
        font-size: 16px !important;
        top: -2px !important;
    }
    h4 {
    font-size: 14px;
    line-height: 18px;
    }
    
    .mob_slide_left{
        margin-left: -50px;
    }
}
.collectionGrid-header h2 {
    font-family: Cera Pro,sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 2rem;
    margin-bottom: 1.25rem;
}
.collectionGrid-link {
    display: flex;
    font-size: 18px;
    position: absolute;
    right: 0;
    top: 4px;
    margin-right: 10px;
}
.collectionGrid-header{
    position: relative;
}
@media only screen and (max-width:991px) {
    a.logo {
    display: inline-block;
    vertical-align: middle;
    line-height: 50px;
}
}
a.logo {
    font-family: serif;
    font-size: 30px;
    color: #fff;
    position: relative;
}
.header--white a.logo {
    color: #a982a4;
}
.ne_glavnaya{
    position: -webkit-sticky;
    position: sticky;
    top: 0;
    background: white;
    z-index: 4;
    border-bottom: 1px solid #ccb3d47d;
}
.ne_glavnaya path{
    fill: #a982a4;
}
.ne_glavnaya .logo{
    color: #a982a4 !important;
}
.ne_glavnaya .eden{
    display: none;
}
 .usf-sr-config {
    float: initial;
    width: initial;
    margin-bottom: 0;
}
.usf-sr-config__mobile-filters-wrapper {
    border: 0;
    padding: 0;
}
.usf-sr-config__mobile-filters-wrapper .page-title_top {
    font-size: 16px;
    margin-bottom: 0;
}
.collection__wrap .page-title_top {
    margin-bottom: 10px;
    padding: 10px 0;
}
.usf-zone * {
    box-sizing: border-box;
    word-break: initial;
}
@media screen and (max-width: 549px){
.page-title_top {
    font-size: 18px;
    line-height: 26px;
}
}
.usf-sr-config__mobile-filters-wrapper {
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid #e5e5e5;
    white-space: nowrap;
}
.page-title_top {
    margin-bottom: 10px;
    padding: 8px 0;
}
.usf-filters {
    border: 0!important;
    margin: 0;
    width: auto;
    padding: 8px;
    font-size: 14px;
    line-height: 18px;
}
.usf-filters__title {
    color: var(--color_text_new);
    font-size: 16px;
    margin-right: 10px;
}
.usf-filters span.usf-icon, .usf-mobile .usf-select span.usf-icon {
    margin-right: 8px;
}
.usf-icon {
    font-family: usf-icon!important;
    speak: none;
    font-style: normal;
    font-weight: 400;
    font-variant: normal;
    text-transform: none;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.usf-filters .usf-icon svg {
    width: 24px;
    margin-bottom: -6px;
}
svg:not(:root) {
    overflow: hidden;
}
.collectionBlock-info {
    padding: 0 0 0 5px;
    position: relative;
    text-align: left;
}
.collectionBlock-info p {
    margin-bottom: 0;
}.collectionBlock-info .supsale {
    color: #ac95c5;
    font-size: 12px;
    font-weight: 400;
    min-height: 20px;
}
.collectionBlock-info .price {
    font-size: 14px;
    line-height: 20px;
}
.collectionBlock-info h4 {
    font-family: Cera Pro,sans-serif;
    font-size: 14px;
    font-weight: 400;
    overflow: hidden;
    padding: 0 10px 0 0;
    text-overflow: ellipsis;
    white-space: nowrap;
    margin-bottom: 0;
}
@media (max-width: 767px){
    .product-preview__info-inner {
        align-items: flex-start !important;
        flex-direction: column;
    }
    .product-preview-colors {
        margin-top: 4px;
        width: 100%;
    }
    .collectionBlock:nth-child(n) {
        padding-left: 2px !important;
        padding-right: 4px !important;
    }
    .collectionBlock:nth-child(2n) {
        padding-right: 2px !important;
        padding-left: 4px !important;
    }
    .prev_slide_arrow{
    display: none;
    }
    .next_slide_arrow{
        display: none;
    }
}
.product-preview__info-inner {
    align-items: center;
    display: flex;
}
.price.sale>span {
    color: #780002;
    margin-right: 5px;
}
.doubly, .money {
    position: relative;
    font-weight: 500;
    font-size: inherit !important;
    text-decoration: inherit !important;
}
.product-preview-colors__items {
    display: flex;
    margin: 0 -2px;
}
.product-preview-colors__item {
    border-radius: 50%;
    cursor: pointer;
    height: 12px;
    margin: 0 2px;
    width: 12px;
    border: 1px solid #ac90b8;
}
.stick_filter{
    position: -webkit-sticky;
    position: sticky;
    top: 44px;
    background: #fff;
    z-index: 2;
}
.logo_footer .logo .font_logo{
    color: #a982a4;
}
@media (min-width: 992px){
    .visible-xs{
        display: none;
    }
    #search.informer{
        width: 40%;
        margin: 70px auto;
        background: #fff;
        overflow: auto;
        height: 80vh;
        position: relative;
        padding: 10px;
    }
    #fastorder.active {
        background: #c8c1c1ed;
    }
    #fn_search{
        position: sticky;
        top: -10px;
    }
}
.pos_rel{
        position: relative;
    }
.hero-slide_gradient.top {
    background: linear-gradient(180deg,rgba(0,0,0,.4),transparent);
    top: 0;
    z-index: 9;
}
.hero-slide_gradient {
    height: 118px;
    position: absolute;
    width: 100%;
}
.hero-slide_gradient.bottom {
    background: linear-gradient(180deg,rgba(0,0,0,.16),transparent);
    bottom: 0;
    transform: scaleY(-1);
}
.dots_index{
    bottom: 19px;
    display: block;
    left: 0;
    position: absolute;
    right: 0;
    text-align: center;
    z-index: 9;
}
.dots_index li {
    background: rgba(255,255,255,.5);
    border-radius: 50%;
    cursor: pointer;
    display: inline-block;
    height: 8px;
    margin: 0 4px;
    overflow: hidden;
    position: relative;
    width: 8px;
}
.dots_index li.slick-active {
    background: rgba(255,255,255,.5);
    width: 24px;
}
.dots_index li.slick-active {
    background: #fff;
    border-radius: 8px;
}
.dots_index li button {
    display: none;
}
.dots_index li.slick-active button {
    background: #fff;
    border: none!important;
    border-radius: inherit!important;
    display: inline-block;
    font-size: 0;
    height: inherit;
    left: 0;
    padding: 0;
    position: absolute;
}
.header__links{
    left: 0;
    height: 100%;
    margin-left: -8px;
    position: absolute;
    top: 0;
    z-index: 3;
}
.header__link--main{
    color: #887569;
}
.header__link{
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    box-sizing: border-box;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    font-size: 0;
    height: 100%;
    padding: 0 8px;
    text-decoration: none;
    transition: color .3s ease;
    vertical-align: middle;
    white-space: nowrap;
}
.header__link:before{
    content: "";
    display: inline-block;
    height: 100%;
    vertical-align: middle;
    width: 0;
}
.header__link span{
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    display: inline-block;
    vertical-align: middle;
}
.header--white .header__link{
    color: #a982a4;
}
.search{
    margin-top: -18px;
    position: absolute;
    right: 152px;
    top: 50%;
    width: 296px;
}

.field{
    box-sizing: border-box;
    height: 36px;
    overflow: hidden;
    position: relative;
    width: 100%;
}
.header--white .search{
    background: transparent;
}
.header--white .field__placeholder{
    color: #a982a4 !important;
}
.field__background{
    background-color: rgba(245,243,243,.64);
    border-radius: 4px;
    border: 1px solid transparent;
    box-sizing: border-box;
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    transition: background-color .3s linear,border-color .3s linear;
    width: 100%;
}
.field__container{
    align-items: center;
    display: flex;
    height: 100%;
    padding: 0 16px;
    position: relative;
}
.field__icon--left{
    margin-left: -6px;
}
.field__icon{
    flex-grow: 0;
    flex-shrink: 0;
    height: 24px;
    margin: 0 8px;
    position: relative;
    width: 24px;
}
.field__inner{
    flex-grow: 1;
    flex-shrink: 1;
    height: 100%;
    position: relative;
}

.field__placeholder{
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    box-sizing: border-box;
    color: #baafa9;
    height: 100%;
    left: 0;
    overflow: hidden;
    padding: 6px 0;
    position: absolute;
    text-overflow: ellipsis;
    top: 0;
    white-space: nowrap;
    width: 100%;
}
.field--white .field__input{
    color: #fff;
}
.field__input{
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    background-color: transparent;
    border: none;
    box-sizing: border-box;
    color: #887569;
    display: block;
    font-family: inherit;
    height: 100%;
    outline: none;
    padding: 6px 0;
    position: relative;
    transition: color .3s linear;
    width: 100%;
}
.field__background{
    background-color: rgba(245,243,243,.64);
    border-radius: 4px;
    border: 1px solid transparent;
    box-sizing: border-box;
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    transition: background-color .3s linear,border-color .3s linear;
    width: 100%;
}
@media screen and (max-width: 1149px){
    .header__links{
        display: none;
    }
    .search{
        display: none;
    }
}
@media screen and (min-width: 1150px){
    .header__icons--left{
        display: none;
    }
}
.ne_glavnaya .header__link {
    color: #a982a4;
}
@media (max-width: 390px){
    .products_item .preview .product_images {
        height: 195px !important;
        background: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }
}
@media only screen and (max-width: 576px){
.products_item .preview .product_images img {
    width: 100%;
    height: auto;
    margin-top: -5px;
}
}
.menu_footer p{
    color: #a982a4;
}
.s1 h2{
    margin-left: 10px;
}
 .ne_glavnaya .field__placeholder{
    color: #a982a4;
}
@media screen and (min-width: 780px){
    .menu_item{
        padding-bottom: 12px;
    } 

}
.menu_centr_mob{
    display: block;
    text-align: center;
}
 .menu-item__droprown .menu-item__links{
    height: auto;
    display: none;
    margin-left: 20px;
}
.menu-item__droprown .show{
    display: block;
}

@keyframes text {
  0%{
    transform: translate(0, 0);
  }
  
  100%{
    transform: translate(-160%, 0);
  }
}
</style>
<div>
                <div class="header {if $module != 'MainView'}ne_glavnaya{/if}">

                    <div class="text-center">
                        <div class="akc">
                            <div class="akc_text">
                                -14% до дня закоханих❤️
                            </div>
                            <div class="countdown-container">
                                <div class="countdown-element countdowndays">
                                    <span class="days">00</span>
                                    <div class="label">Дн.</div>
                                </div>
                                <div class="countdown-element countdownhours">
                                    <span class="hours"></span>
                                    <div class="label">Год.</div>
                                </div>
                                <div class="countdown-element countdownminutes">
                                    <span class="minutes"></span>
                                    <div class="label">Хв.</div>
                                </div>
                                <div class="countdown-element countdownseconds">
                                    <span class="seconds"></span>
                                    <div class="label">Сек.</div>
                                </div>
                            </div>
                        </div>
                            
                        {if {$smarty.cookies.discount}}
                            <p class="eden hidden">{$lang->for_you}</p>
                        {else}
                            <p class="eden hidden">{$lang->free_del}</p>
                        {/if}
                    
                    </div>
                        <div class="header__frame">
                                <div class="header__background" style="opacity: 1;">
                                </div>
                                <div class="header__inner">
                                        <div class="header__icons header__icons--left">
                                                <div class="header-icon menu_open">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                        height="14" width="18" viewBox="0 0 18 14" class="icon icon--white"
                                                        style="height: 14px; width: 18px; left: 50%; margin-left: -9px; margin-top: -7px; position: absolute; top: 50%;">
                                                                <path id="time-3-icon" fill-rule="evenodd" clip-rule="evenodd" d="M0.4 0.4H17.6V1.6H0.4V0.4Z">
                                                                </path>
                                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M0.4 6.4H17.6V7.6H0.4V6.4Z">
                                                                </path>
                                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M0.4 12.4H17.6V13.6H0.4V12.4Z">
                                                                </path>
                                                        </svg>
                                                </div>
                                                <div class="header-icon open_search">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                        height="17" width="17" viewBox="0 0 17 17" class="icon icon--white"
                                                        style="height: 16px; width: 16px; left: 50%; margin-left: -8px; margin-top: -8px; position: absolute; top: 50%;">
                                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M11.5074 12.3559C10.2896 13.3818 8.71698 14 7 14C3.13401 14 0 10.866 0 7C0 3.13401 3.13401 0 7 0C10.866 0 14 3.13401 14 7C14 8.71698 13.3818 10.2896 12.3559 11.5074L16.4243 15.5757L15.5757 16.4243L11.5074 12.3559ZM12.8 7C12.8 10.2033 10.2033 12.8 7 12.8C3.79675 12.8 1.2 10.2033 1.2 7C1.2 3.79675 3.79675 1.2 7 1.2C10.2033 1.2 12.8 3.79675 12.8 7Z">
                                                                </path>
                                                        </svg>
                                                </div>
                                        </div>
                                        <div class="header__links">
                                                        {foreach $categories as $c}
                                                        {if $c->visible}
                                                            <a data-v-4a123933="" href="{$lang_link}{if $c->id != 4}catalog/{/if}{$c->url}" class="header__link header__link--main">
                                                                <span>{$c->name|escape}</span>
                                                            </a>
                                                        {/if}
                                                {/foreach}
                                        </div>
                                        <div class="header__logotype {if $category->id == $c->id}selected{/if}">
                                            <a class="logo" href="{$lang_link}">
                                               <span class="font_logo" data-language="site_name">ELALIZA</span>
                                            </a>
                                        </div>
                                        <div class="search">
                                                <div class="field field--white">
                                                        <div class="field__background">
                                                        </div>
                                                        <div class="field__container">
                                                                <div class="field__icon field__icon--left">
                                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                                        height="17" width="17" viewBox="0 0 17 17" class="icon icon--white" style="height: 16px; width: 16px; left: 50%; margin-left: -8px; margin-top: -8px; position: absolute; top: 50%;">
                                                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M11.5074 12.3559C10.2896 13.3818 8.71698 14 7 14C3.13401 14 0 10.866 0 7C0 3.13401 3.13401 0 7 0C10.866 0 14 3.13401 14 7C14 8.71698 13.3818 10.2896 12.3559 11.5074L16.4243 15.5757L15.5757 16.4243L11.5074 12.3559ZM12.8 7C12.8 10.2033 10.2033 12.8 7 12.8C3.79675 12.8 1.2 10.2033 1.2 7C1.2 3.79675 3.79675 1.2 7 1.2C10.2033 1.2 12.8 3.79675 12.8 7Z">
                                                                                </path>
                                                                        </svg>
                                                                </div>
                                                                <div class="field__inner">
                                                                        <div class="field__placeholder">
                                                                                <span>
                                                                                        Поиск
                                                                                </span>
                                                                        </div>
                                                                        <input name="search" autocomplete="off" class="field__input">
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                                        <div class="header__icons header__icons--right">
                                                <a href="tel:+380937060605" class="header-icon">
                                                    <div class="icon" style="height: 16px; width: 18px; left: 50%; margin-left: -9px; margin-top: -8px; position: absolute; top: 50%;">
                                                        <div class="icon__layer" name="fade">
                                                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                                         viewBox="0 0 473.806 473.806" style="enable-background:new 0 0 473.806 473.806;" xml:space="preserve">
                                                                    <g>
                                                                        <g>
                                                                            <path d="M374.456,293.506c-9.7-10.1-21.4-15.5-33.8-15.5c-12.3,0-24.1,5.3-34.2,15.4l-31.6,31.5c-2.6-1.4-5.2-2.7-7.7-4
                                                                                c-3.6-1.8-7-3.5-9.9-5.3c-29.6-18.8-56.5-43.3-82.3-75c-12.5-15.8-20.9-29.1-27-42.6c8.2-7.5,15.8-15.3,23.2-22.8
                                                                                c2.8-2.8,5.6-5.7,8.4-8.5c21-21,21-48.2,0-69.2l-27.3-27.3c-3.1-3.1-6.3-6.3-9.3-9.5c-6-6.2-12.3-12.6-18.8-18.6
                                                                                c-9.7-9.6-21.3-14.7-33.5-14.7s-24,5.1-34,14.7c-0.1,0.1-0.1,0.1-0.2,0.2l-34,34.3c-12.8,12.8-20.1,28.4-21.7,46.5
                                                                                c-2.4,29.2,6.2,56.4,12.8,74.2c16.2,43.7,40.4,84.2,76.5,127.6c43.8,52.3,96.5,93.6,156.7,122.7c23,10.9,53.7,23.8,88,26
                                                                                c2.1,0.1,4.3,0.2,6.3,0.2c23.1,0,42.5-8.3,57.7-24.8c0.1-0.2,0.3-0.3,0.4-0.5c5.2-6.3,11.2-12,17.5-18.1c4.3-4.1,8.7-8.4,13-12.9
                                                                                c9.9-10.3,15.1-22.3,15.1-34.6c0-12.4-5.3-24.3-15.4-34.3L374.456,293.506z M410.256,398.806
                                                                                C410.156,398.806,410.156,398.906,410.256,398.806c-3.9,4.2-7.9,8-12.2,12.2c-6.5,6.2-13.1,12.7-19.3,20
                                                                                c-10.1,10.8-22,15.9-37.6,15.9c-1.5,0-3.1,0-4.6-0.1c-29.7-1.9-57.3-13.5-78-23.4c-56.6-27.4-106.3-66.3-147.6-115.6
                                                                                c-34.1-41.1-56.9-79.1-72-119.9c-9.3-24.9-12.7-44.3-11.2-62.6c1-11.7,5.5-21.4,13.8-29.7l34.1-34.1c4.9-4.6,10.1-7.1,15.2-7.1
                                                                                c6.3,0,11.4,3.8,14.6,7c0.1,0.1,0.2,0.2,0.3,0.3c6.1,5.7,11.9,11.6,18,17.9c3.1,3.2,6.3,6.4,9.5,9.7l27.3,27.3
                                                                                c10.6,10.6,10.6,20.4,0,31c-2.9,2.9-5.7,5.8-8.6,8.6c-8.4,8.6-16.4,16.6-25.1,24.4c-0.2,0.2-0.4,0.3-0.5,0.5
                                                                                c-8.6,8.6-7,17-5.2,22.7c0.1,0.3,0.2,0.6,0.3,0.9c7.1,17.2,17.1,33.4,32.3,52.7l0.1,0.1c27.6,34,56.7,60.5,88.8,80.8
                                                                                c4.1,2.6,8.3,4.7,12.3,6.7c3.6,1.8,7,3.5,9.9,5.3c0.4,0.2,0.8,0.5,1.2,0.7c3.4,1.7,6.6,2.5,9.9,2.5c8.3,0,13.5-5.2,15.2-6.9
                                                                                l34.2-34.2c3.4-3.4,8.8-7.5,15.1-7.5c6.2,0,11.3,3.9,14.4,7.3c0.1,0.1,0.1,0.1,0.2,0.2l55.1,55.1
                                                                                C420.456,377.706,420.456,388.206,410.256,398.806z"/>
                                                                            <path d="M256.056,112.706c26.2,4.4,50,16.8,69,35.8s31.3,42.8,35.8,69c1.1,6.6,6.8,11.2,13.3,11.2c0.8,0,1.5-0.1,2.3-0.2
                                                                                c7.4-1.2,12.3-8.2,11.1-15.6c-5.4-31.7-20.4-60.6-43.3-83.5s-51.8-37.9-83.5-43.3c-7.4-1.2-14.3,3.7-15.6,11
                                                                                S248.656,111.506,256.056,112.706z"/>
                                                                            <path d="M473.256,209.006c-8.9-52.2-33.5-99.7-71.3-137.5s-85.3-62.4-137.5-71.3c-7.3-1.3-14.2,3.7-15.5,11
                                                                                c-1.2,7.4,3.7,14.3,11.1,15.6c46.6,7.9,89.1,30,122.9,63.7c33.8,33.8,55.8,76.3,63.7,122.9c1.1,6.6,6.8,11.2,13.3,11.2
                                                                                c0.8,0,1.5-0.1,2.3-0.2C469.556,223.306,474.556,216.306,473.256,209.006z"/>
                                                                    </svg>


                                                            </div>
                                                        </div>
                                                    </a>
                                                <a href="/cart" class="header-icon">
                                                    <div id="cart_informer" class="informer">
                                                        {include file='cart_informer.tpl'}
                                                    </div>
                                                </a>
                                        </div>
                                </div>
                        </div>
                </div>
                <div class="menu__popup" id="show_menu" style="top: 0px; height: calc(100% - 0px);">
                        <div class="menu__scroll">
                                <div class="menu__inner menu__inner--with-app">
                                        <div class="menu__header">
                                                <div class="menu__close">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                        height="16" width="16" viewBox="0 0 16 16" class="icon icon--main" style="height: 15.6px; width: 15.6px; left: 50%; margin-left: -7.8px; margin-top: -7.8px; position: absolute; top: 50%;">
                                                                <path d="M1 0.15147L0.151472 1L7.08182 7.93035L0.151472 14.8607L1 15.7092L7.93035 8.77888L14.8607 15.7092L15.7092 14.8607L8.77888 7.93035L15.7092 0.999998L14.8607 0.15147L7.93035 7.08182L1 0.15147Z">
                                                                </path>
                                                        </svg>
                                                </div>
                                        </div>
                                        <div class="menu__content">
                                                <div class="menu">
                                                        {foreach $categories as $c}
                                                        {if $c->visible}
                                                        <a class="{if $category->id == $c->id}selected{/if}" href="{$lang_link}{if $c->id != 4}catalog/{/if}{$c->url}" data-category="{$c->id}">
                                                            <div class="menu-item menu-item--primary">
                                                                <div href="" target="_self" class="menu-item__link--sticky menu-item__link--primary menu-item__link menu_centr_mob">
                                                                        <div class="menu-item__label">
                                                                            {$c->name|escape}
                                                                        </div>
                                                                </div>
                                                            </div>           
                                                        </a>
                                                        {/if}
                                                        {/foreach}
                                                        <div class="menu-item menu-item--primary multilink">
                                                                <div href="" target="_self" class="menu-item__link--sticky menu-item__link--primary menu-item__link">
                                                                        <div class="menu-item__label">
                                                                                Покупцям
                                                                        </div>
                                                                        <div class="menu-item__arrow">
                                                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                                                height="7" width="12" viewBox="0 0 12 7" class="icon icon--main" style="height: 6.7px; width: 11.7px; left: 50%; margin-left: -5.8px; margin-top: -3.3px; position: absolute; top: 50%;">
                                                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M11.8485 1L6 6.84853L0.15147 1L0.999999 0.151472L6 5.15147L11 0.151472L11.8485 1Z">
                                                                                        </path>
                                                                                </svg>
                                                                        </div>
                                                                </div>
                                                                 <div class="menu-item__droprown">
                                                                    <div class="menu-item__links">
                                                                        <div class="menu-item menu-item--secondary">
                                                                            <a href="/dostavka" target="_blank" class="menu-item__link menu-item__link--secondary">
                                                                                <div class="menu-item__label">Доставка і оплата</div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="menu-item menu-item--secondary">
                                                                            <a data-v-d2b2c7ae="" href="/obmen-i-vozvrat" target="_blank" class="menu-item__link menu-item__link--secondary">
                                                                                <div class="menu-item__label">Обмін і повернення</div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="menu-item menu-item--secondary">
                                                                            <a href="/contact" target="_blank" class="menu-item__link menu-item__link--secondary">
                                                                                <div class="menu-item__label">Контакти</div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="menu-item menu-item--secondary">
                                                                            <a href="/reviews" target="_blank" class="menu-item__link menu-item__link--secondary">
                                                                                <div class="menu-item__label">Відгуки({$reviews_count})</div>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                        <div class="menu-item menu-item--primary multilink">
                                                                <div href="" target="_self" class="menu-item__link--sticky menu-item__link--primary menu-item__link">
                                                                        <div class="menu-item__label">
                                                                                Спільноти ELALIZA
                                                                        </div>
                                                                        <div class="menu-item__arrow menu-item__arrow--rotated">
                                                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                                                height="7" width="12" viewBox="0 0 12 7" class="icon icon--main" style="height: 6.7px; width: 11.7px; left: 50%; margin-left: -5.8px; margin-top: -3.3px; position: absolute; top: 50%;">
                                                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M11.8485 1L6 6.84853L0.15147 1L0.999999 0.151472L6 5.15147L11 0.151472L11.8485 1Z">
                                                                                        </path>
                                                                                </svg>
                                                                        </div>
                                                                </div>
                                                                <div class="menu-item__droprown">
                                                                    <div class="menu-item__links">
                                                                        <div class="menu-item menu-item--secondary">
                                                                            <a href="https://www.instagram.com/elaliza_ua/" target="_blank" class="menu-item__link menu-item__link--secondary">
                                                                                <div class="menu-item__label">Instagram</div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="menu-item menu-item--secondary">
                                                                            <a href="https://www.youtube.com/channel/UCI2Qgrnk1nV_g3PJb99wObA" target="_blank" class="menu-item__link menu-item__link--secondary">
                                                                                <div class="menu-item__label">YouTube </div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="menu-item menu-item--secondary">
                                                                            <a href="https://t.me/elaliza_telegram" target="_blank" class="menu-item__link menu-item__link--secondary">
                                                                                <div class="menu-item__label">Telegram</div>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </div>
                {* Тело сайта *}
                <div id="fn_content" class="main">
                    {if $is_mobile === false && $is_tablet === false}
                        {get_banner var=banner_group1 group='group1'}
                        {if $banner_group1->items}
                            <div class="fn_banner_group1 banners container">
                                {foreach $banner_group1->items as $bi}
                                    <div>
                                        {if $bi->url}
                                        <a href="{$bi->url}" target="_blank">
                                            {/if}
                                            {if $bi->image}
                                                <img src="{$config->banners_images_dir}{$bi->image}" alt="{$bi->alt}" title="{$bi->title}"/>
                                            {/if}
                                            {if $bi->url}
                                        </a>
                                        {/if}
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                    {/if}
                    {if $module == "MainView"}
                                        {get_banner var=banner_group1 group=group1}
                                        {if $banner_group1->items}
                                        <div class="container hidden-md-down">
                                            <div class="fn-slick-banner_group1 okaycms slick-banner">
                                            </div>
                                        </div>
                                        {/if}	                	
                							<div class="banner_box category_banner">
                                                {foreach $banner_group1->items as $bi}
                                                <div class=" col-xs-6 col-sm-6 col-md-3 p-0 inner_cat_banner">
                                                    {if $bi->url}
                                                        <a href="{$bi->url}" target="_blank">
                                                    {/if}
                                                    {if $bi->image}
                                                        <img src="{$config->banners_images_dir}{$bi->image}" alt="{$bi->alt}" title="{$bi->title}"/>
                                                    {/if}
                                                    <div class="title">
                                                        <h3>{$bi->title}</h3>
                										{if $bi->description}<p>{$bi->description}</p>{/if}
                                                    </div>

                                                    {if $bi->url}
                                                    </a>
                                                    {/if}
                                                </div>
                                                {/foreach}
                							</div>
                        <div class="fn_ajax_content top_from_menu">
                            {$content}
                        </div>        
                        <script>
                            $(window).scroll(function() {    
                                var scroll = $(window).scrollTop();
                                if (scroll >= 5) {
                                    $(".header").addClass("header--white");
                                    $(".eden").removeClass("hidden");
                                    
                                }else if(scroll <= 5){
                                    $(".header").removeClass("header--white");
                                    $(".eden").addClass("hidden");            
                                }
                            });
                        </script>
                        <style>
                            .products_item .preview .product_images {
                                height: 400px;
                                background: #fff;
                                display: flex;
                                align-items: center;
                                justify-content: center;
                                overflow: hidden;
                            }
                            .slick_title{
                                color: #fff;
                                font-family: ALS Alumna,Cera Pro,sans-serif;
                                font-size: 32px;
                                font-variant-ligatures: no-contextual;
                                line-height: 40px;
                                width: 100%;
                            }
                            .slide_title span {
                                border-bottom: 1px solid hsla(0,0%,100%,.4);
                            }
                            .slide_content{
                                align-items: center;
                                display: flex;
                                flex-direction: column;
                                justify-content: flex-end;
                                transform: translateZ(1px);
                            }
                            .slide_layer{
                                bottom: 0;
                                left: 0;
                                position: absolute;
                                right: 0;
                                top: 0;
                                -webkit-backface-visibility: hidden;
                                backface-visibility: hidden;
                                overflow: hidden;
                            }
                            .slide_content_holder{
                                margin-left: 16px;
                                margin-right: 16px;
                                width: auto;
                                box-sizing: border-box;
                                padding: 64px 0;
                                text-align: center;
                                -webkit-backface-visibility: hidden;
                                backface-visibility: hidden;
                            }
                            @media (min-width: 1280px){
                                .slick_title{
                                    font-size: 60px;
                                    line-height: 76px;
                                }
                                .slide_content{
                                    justify-content: center;
                                }
                                .slide_content_holder{
                                    margin-left: 56px;
                                    margin-right: 56px;
                                }
                            }
                            .slick_zone{
                                cursor: pointer;
                                height: 100%;
                                position: absolute;
                                top: 0;
                                width: 130px;
                                z-index: 5;
                            }
                            .prev_slide_arrow{
                                left: 0;
                            }
                            .next_slide_arrow{
                                right: 0;
                            }
                            .slider__arrow{
                                position: absolute;
                                left: 50%;
                                margin-left: -8.71px;
                                width: 17.41px;
                                height: 33.32px;
                                margin-top: -16.66px;
                                top: 50%;
                                transition: transform .2s ease;
                            }
                        </style>
                    {else}
                        <div class="container-fluid">
                            {include file='breadcrumb.tpl'}
                            <div class="fn_ajax_content top_from_menu">
                                {$content}
                            </div>
                       </div>
                    {/if}
                </div>
                    <div class="to_top">
                        <i class="fa fa-long-arrow-up"></i>
                    </div>

                	{* Footer *}
                    <footer>
                		{* Subscribing 
                        <div class="subscribe_block">
                            <div class="container-fluid"> 
                                <div id="subscribe_container">
                                    <div class="icon_subscribe">
                						<svg xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" width="20px" height="20px">
                							<path d="m494.2,488c0,0 0-225.8 0-301 0-3.1-3.9-7-7.7-9.9l-78.7-57.1v-63.1c0-6.2-5.2-10.4-10.4-10.4h-89.7l-45.7-33.3c-3.1-2.1-8.3-2.1-11.5,0l-45.7,33.3h-89.7c-6.2,0-10.4,5.2-10.4,10.4v62.4l-79.7,57.9c-4.7,2.9-7.7,6.7-7.7,9.9 0,75.7 0,303 0,303 0,5.9 4.7,10 9.6,10.4 0.3,0 0.5,0 0.8,0h456c6.7-0.1 10.5-5.3 10.5-12.5zm-19.8-282.3v263.6l-172.1-137.8 172.1-125.8zm-7.7-18.3l-58.9,42.9v-86.2l58.9,43.3zm-210.9-154.5l18.3,13.5h-36.7l18.4-13.5zm131.2,34.4v178.2l-131.2,95.6-131.2-95.6v-178.2h262.4zm-349.8,138.4l172.1,125.8-172.1,138.6v-264.4zm67.6,25.4l-60.4-44 60.4-43.9v87.9zm-48.9,249.5l170.1-136.9 23.5,17.2c4.5,3.4 7.9,3.4 12.5,0l23.5-17.2 171.1,136.9h-400.7z" fill="currentColor"/>
                							<rect width="140.5" x="186.1" y="118.3" height="19.8" fill="currentColor"/>
                							<rect width="140.5" x="186.1" y="181.8" height="19.8" fill="currentColor"/>
                							<rect width="140.5" x="186.1" y="245.3" height="19.8" fill="currentColor"/>
                						</svg>
                                    </div>
                                    <div class="subscribe_heading">
                                        <span data-language="subscribe_heading">{$lang->subscribe_heading}</span>
                                    </div>
                                    <div class="subscribe_promotext">
                                        <span data-language="subscribe_promotext">{$lang->subscribe_promotext}</span>
                                    </div>
                                    <form class="subscribe_form fn_validate_subscribe" method="post">
                                        <input type="hidden" name="subscribe" value="1"/>

                                        <div class="form_group">
                                            <input class="subscribe_input" type="email" name="subscribe_email" value="" data-format="email" data-notice="{$lang->form_email}" placeholder="{$lang->form_email}"/>
                                        </div>

                                        <div class="boxed_button">
                                            
                                            <button class="btn btn_black subscribe_button" type="submit"><span data-language="subscribe_button">{$lang->subscribe_button}</span><i></i></button>
                                        </div> 
                                    </form>
                                </div>
                            </div>
                        </div>
                                    <div id="subscribe_container">
                                        <form class="subscribe_form fn_validate_subscribe" method="post">
                                            <input type="hidden" name="subscribe" value="1"/>
                                            <input class="subscribe_input" type="email" name="subscribe_email" value="" data-format="email" placeholder="{$lang->form_email}"/>
                                            {if $subscribe_error}
                                                <div id="subscribe_error" class="popup">
                                                    {if $subscribe_error == 'email_exist'}
                                                        <span data-language="subscribe_already">{$lang->index_subscribe_already}</span>
                                                    {/if}
                                                    {if $subscribe_error == 'empty_email'}
                                                        <span data-language="form_enter_email">{$lang->form_enter_email}</span>
                                                    {/if}
                                                </div>
                                            {/if}
                                            {if $subscribe_success}
                                                <div id="fn_subscribe_sent" class="popup">
                                                    <span data-language="subscribe_sent">{$lang->index_subscribe_sent}</span>
                                                </div>
                                            {/if}
                                        </form>
                                    </div>	*}	
                        <div class="footer_top">
                            <div class="container-fluid">
                                <div class="logo_footer">
                                    <a class="logo" href="javascript:;">
                                        
                                        <span class="font_logo" data-language="site_name">ELALIZA</span>
                                    </a>
                                </div>
                				{* Main menu *}
                                <div class="col-sm-6">
                                    <div class="menu_footer">
                                        <ul>
                                            <li class="foot_item">
                                              {$menu_footer}
                                                <div class="menu_group menu_group_footer">
                                                    <ul class="fn_menu_list menu_list menu_list_1">
                                                        <li class="menu_item menu_item_1 ">
                                                            <a class="menu_link" href="reviews">
                                                                <span>{$lang->reviews_site}({$reviews_count}) </span>
                                                             </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="menu_footer">
                                        <p>{$lang->instagram}</p>
                                        <a href="https://instagram.com/elaliza_ua" target="_blank">
                                            <span><img src="design/{$settings->theme}/images/insta_icon.png"></span>
                                        </a>
                                    </div>
                                </div>
                				{* Social buttons 
                                <div class="foot_social">
                                    <a class="fb" href="https://facebook.com/okaycms" target="_blank" title="Facebook">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                    <a class="vk" href="https://vk.com/club72497645" target="_blank" title="В контакте">
                                        <i class="fa fa-vk"></i>
                                    </a>
                                    <a class="gp" href="#" target="_blank" title="Google plus">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
                                    <a class="tw" href="https://twitter.com/okaycms" target="_blank" title="Twitter">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                    <a class="ins" href="#" target="_blank"  title="Instagram">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </div>
                				*}
                            </div>
                        </div>
                        <div class="footer_bottom">
                            <div class="container-fluid">
                                <div class="float-sm-right">
                                    <div class="s-footer__payments">
                                        Приймаємо до оплати
                                        <div class="e-footer__payments payments__inner">
                                            {include file='svg.tpl' svgId='way'}
                                            {include file='svg.tpl' svgId='visa'}
                                            {include file='svg.tpl' svgId='master'}
                                    <!--        <img class="s-footer__payment" src="/local/templates/theme_2021/static/img/privat.png" alt="" role="presentation">
                                            <img class="s-footer__payment" src="/local/templates/theme_2021/static/img/mono.png" alt="" role="presentation">-->
                                        </div>
                                    </div>
                                    <ul class="informers">
                				        {* Languages *}
                						{if $languages|count > 1}
                						{$cnt = 0}
                						{foreach $languages as $ln}
                                        {if $ln->enabled}
                                        {$cnt = $cnt+1}
                                        {/if}
                						{/foreach}
                						{if $cnt>1}	
                                        <li class="informer languages">
                                            <div class="fn_switch_dropdown wrap_dropdown lang_switch">
                								<span data-language="language_name">{$lang->language_name}</span>
                								<span class="informer_name lg-hidden">{$language->label}</span>
                                                <i class="fa fa-caret-down" aria-hidden="true" style="margin-left: 5px; margin-right: 5px;"></i>			
                                            	<div class="dropdown-menu">
                                                {foreach $languages as $l}
                                                    {if $l->enabled}
                                                        <a class="dropdown_item{if $language->id == $l->id} active{/if}"
                                                           href="{$l->url}">
                                                           <span class="tablet-hidden">{$l->current_name}</span>
                                                           <span class="lg-hidden">{$l->label}</span>
                                                        </a>
                                                    {/if}
                                                {/foreach}
                                            	</div>
                                            </div>
                                        </li>
                						{/if}
                						{/if}		
                						{* Currencies *}
                						{if $currencies|count > 1}
                						<li class="informer currencies">
                                            <div class="fn_switch_dropdown wrap_dropdown cur_switch">
                                                <span data-language="currency_name">{$lang->currency_name}</span>
                                                <span class="informer_name lg-hidden">{$currency->sign}</span>
                                                <i class="fa fa-caret-down" aria-hidden="true" style="margin-left: 5px; margin-right: 5px;"></i>

                                                <div class="dropdown-menu">
                                                    {foreach $currencies as $c}
                									{if $c->enabled}
                									<a class="dropdown_item{if $currency->id== $c->id} active{/if}" href="{url currency_id=$c->id}">
                										<span class="tablet-hidden">{$c->name}</span>
                										<span class="lg-hidden">{$c->sign}</span>
                									</a>
                									{/if}
                									{/foreach}
                                                </div>
                                            </div>
                                        </li>
                						{/if}
                                    </ul>
                                </div>
                                <div class="float-sm-left">
                                    <span>ELALIZA © 2018 - 2024</span>
                                </div>
                            </div>        
                        </div>
                        {if $smarty.cookies.set_leng=='' && $language->id !=3 }
                            {include file='first_lang.tpl'}
                        {/if}
                    </footer>
                {* Форма обратного звонка 
                {include file='callback.tpl'}
                *}
                {if $is_lighthouse}
                {if $settings->body_custom_script}
                    {$settings->body_custom_script}
                {/if} 
                {/if}  
                {if $is_lighthouse}
                <script src="design/{$settings->theme}/js/slick.min.js"></script>
                <script src="design/{$settings->theme}/js/jquery-ui.min.js"></script>
                <link href="design/{$settings->theme}/css/jquery.fancybox.min.css" rel="stylesheet">
                <script src="design/{$settings->theme}/js/jquery.fancybox.min.js" defer></script>
                <script src="design/{$settings->theme}/js/jquery.autocomplete-min.js" defer></script>
                <script src="design/{$settings->theme}/js/jquery.validate.min.js" ></script>
                <script src="design/{$settings->theme}/js/additional-methods.min.js"></script>
                <script src="design/{$settings->theme}/js/jscookie.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>
                {/if}  
                <script type="text/javascript">
                    $(document).ready(function(){

                       
                         $('.your-class').slick({

                            speed: 500,
                            slidesToShow: 1,
                            slidesToScroll: 1,
                            swipeToSlide : true,
                            dots:true,
                            dotsClass: 'dots_index',
                            autoplay: true,
                            prevArrow: $('.prev_slide_arrow'),
                            nextArrow: $('.next_slide_arrow'),
                            responsive: [
                                {
                                  breakpoint: 1200,
                                  settings: {
                                    arrows: true
                                  }
                                },
                                {
                                  breakpoint: 992,
                                  settings: {
                                    arrows: false
                                  }
                                },
                                   {
                                  breakpoint: 767,
                                  settings: {
                                    arrows: false,
                                  }
                                }
                            ]
                        });
                        $('.fn_banner_insta_top_prod').slick({
                           speed: 500,
                            slidesToShow: 5,
                            slidesToScroll: 1,
                            swipeToSlide : true,
                            arrows: false,
                            responsive: [
                                {
                                  breakpoint: 1200,
                                  settings: {
                                    slidesToShow: 5,
                                  }
                                },
                                {
                                  breakpoint: 992,
                                  settings: {
                                    slidesToShow: 3,
                                  }
                                },
                                   {
                                  breakpoint: 767,
                                  settings: {
                                    slidesToShow: 3
                                  }
                                },
                                {
                                  breakpoint: 576,
                                  settings: {
                                    arrows: false,
                                    centerMode: true,
                                    rightPadding: '10px',
                                    slidesToShow: 2
                                  }
                                }
                            ]
                        });



                    
                    });
                  </script>
                        <div id="fastorder">
                             <div id="search" class="informer">
                                <form id="fn_search" class="" action="all-products">
                                    <div class="popup_search">
                                            <div class="search__field_popup">
                                                    <div class="field field--main">
                                                            <div class="field__background">
                                                            </div>
                                                            <div class="field__container">
                                                                    <div class="field__icon field__icon--left">
                                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                            height="17" width="17" viewBox="0 0 17 17" class="icon icon--secondary"
                                                                            style="height: 16px; width: 16px; left: 50%; margin-left: -8px; margin-top: -8px; position: absolute; top: 50%;">
                                                                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M11.5074 12.3559C10.2896 13.3818 8.71698 14 7 14C3.13401 14 0 10.866 0 7C0 3.13401 3.13401 0 7 0C10.866 0 14 3.13401 14 7C14 8.71698 13.3818 10.2896 12.3559 11.5074L16.4243 15.5757L15.5757 16.4243L11.5074 12.3559ZM12.8 7C12.8 10.2033 10.2033 12.8 7 12.8C3.79675 12.8 1.2 10.2033 1.2 7C1.2 3.79675 3.79675 1.2 7 1.2C10.2033 1.2 12.8 3.79675 12.8 7Z">
                                                                                    </path>
                                                                            </svg>
                                                                    </div>
                                                                    <div class="field__inner">
                                                                            <input class="fn_search search_input field__input" type="text" name="keyword" value="" data-language="index_search" placeholder="{$lang->input_search}" class="">
                                                                    </div>
                                                            </div>
                                                    </div>
                                            </div>
                                            <div class="close_search">
                                                    <span>
                                                        {$lang->close}
                                                    </span>
                                            </div>
                                    </div>
                                </form>
                                <div class="container" id="result_search"></div>
                            </div>
                         </div>
                            <style>
                                .popup_search{
                                background-color: #fff;
                                display: flex;
                                padding: 0 10px;
                                position: sticky;
                                top: 0;
                                z-index: 1;
                            }
                            .search__field_popup {
                                    flex-grow: 1;
                                    flex-shrink: 1;
                                }
                            .field {
                                box-sizing: border-box;
                                height: 36px;
                                overflow: hidden;
                                position: relative;
                                width: 100%;
                            }
                            .field__background {
                                background-color: rgba(245,243,243,.64);
                                border-radius: 4px;
                                border: 1px solid transparent;
                                box-sizing: border-box;
                                height: 100%;
                                left: 0;
                                position: absolute;
                                top: 0;
                                transition: background-color .3s linear,border-color .3s linear;
                                width: 100%;
                            }
                            .field__container {
                                align-items: center;
                                display: flex;
                                height: 100%;
                                padding: 0 16px;
                                position: relative;
                            }
                            .field__icon--left {
                                margin-left: -6px;
                            }
                            .field__icon {
                                flex-grow: 0;
                                flex-shrink: 0;
                                height: 24px;
                                position: relative;
                                width: 24px;
                            }
                            .field__inner {
                                flex-grow: 1;
                                flex-shrink: 1;
                                height: 100%;
                                position: relative;
                            }
                            .field__placeholder {
                                font-size: 16px;
                                font-weight: 400;
                                line-height: 24px;
                                box-sizing: border-box;
                                color: #fff;
                                height: 100%;
                                left: 0;
                                overflow: hidden;
                                padding: 6px 0;
                                position: absolute;
                                text-overflow: ellipsis;
                                top: 0;
                                white-space: nowrap;
                                width: 100%;
                            }
                            .field__input {
                                font-size: 16px;
                                font-weight: 400;
                                line-height: 24px;
                                background-color: transparent;
                                border: none;
                                box-sizing: border-box;
                                color: #887569;
                                display: block;
                                font-family: inherit;
                                height: 100%;
                                outline: none;
                                padding: 6px 0;
                                position: relative;
                                transition: color .3s linear;
                                width: 100%;
                            }
                            .close_search {
                                font-size: 16px;
                                font-weight: 400;
                                line-height: 24px;
                                color: #887569;
                                cursor: pointer;
                                flex-grow: 0;
                                flex-shrink: 0;
                                margin-left: 16px;
                                padding: 6px 0;
                            }
                            #fastorder {
                                position: fixed;
                                z-index: 4;
                                overflow: auto;
                                left: 0;
                                top: 100%;
                                width: 100%;
                                opacity: 0;
                                padding: 20px 10px;
                                height: 100%;
                                background-color: #fff;
                                color: #343838;
                                -webkit-transition: all 350ms cubic-bezier(.6,.05,.28,.91);
                                transition: all 350ms cubic-bezier(.6,.05,.28,.91);
                            }
                            #fastorder.active{
                                top:0;
                                opacity:1;
                                z-index:300;
                            }
                            .search_img{
                                width: 50px;
                            }
                            .search_images {
                                height: 50px;
                                background: #fff;
                                display: flex;
                                align-items: center;
                                justify-content: center;
                                overflow: hidden;
                                float: left;
                            }
                            .search_result_item{
                                display: inline-block;
                                width: 100%;
                                padding: 5px;
                                border: 1px solid #f1f1f1;
                                margin-top: 3px;
                                border-radius: 5px;
                                background: #f1f1f1;
                            }
                            .search_result_item span{

                            }
                            .search_prod_info span{
                                padding-left: 15px;
                            }
                            .search_name strong{
                                padding-left: 15px;
                            }
                            .search_input:focus::placeholder{
                                opacity: 1;
                            }
                            .heading_box_insta{
                                margin: 10px 0 45px;
                                font-size: 3em;
                                text-align: center;
                            }
                            .feb_dis{
                                position: absolute;
                                left: 0;
                                top: 0;
                                background: red;
                                color: #fff;
                                padding: 2px 5px;
                                font-weight: bold;
                            }
                            .countdown-container {
                                display: flex;
                                justify-content: center;
                                align-items: center;
                                background: #333; /* Цвет фона */
                                color: #fff; /* Цвет текста */
                                font-family: Arial, sans-serif; /* Шрифт */
                                padding: 3px; /* Отступы вокруг */
                            }

                            .countdown-element {
                                display: flex;
                                flex-direction: column;
                                align-items: center;
                                margin: 0 5px; /* Отступы между элементами */
                            }

                            .countdown-element span {
                                font-size: 2em; /* Размер шрифта чисел */
                                font-weight: bold;
                            }

                            .countdown-element .label {
                                font-size: 0.75em; /* Размер шрифта подписей */
                            }
                            .akc{
                                display: flex;
                                justify-content: center;
                                align-items: center;
                                background: #333;
                                color: #fff;
                            }
                            .akc_text{
                                font-size: 1.5em;
                            }
                            </style>
                        </div>
                        <script>
                            $( ".menu_open" ).click(function() {
                                $('#show_menu').addClass('menu_popup_visible');
                            });
                            $( ".menu__close" ).click(function() {
                                $('#show_menu').removeClass('menu_popup_visible');
                            });
                            $( ".open_search" ).click(function() {
                                $("#fastorder").addClass('active');
                                $('.search_input').focus();
                            });
                            $( ".search" ).click(function() {
                                $("#fastorder").addClass('active');
                                $('.search_input').focus();
                            });
                            $(".close_search").click(function() {  //use a class, since your ID gets mangled
                                $("#fastorder").removeClass("active");      //add the class to the clicked element
                            });
                            $( ".multilink" ).click(function() {
                                $(this).children().children('.menu-item__links').toggleClass("show");
                                 // this.$('.menu-item__links').toggleClass('show')
                                });

                            function initDailyCountdown() {
                                var hoursContainer = document.querySelector('.countdownhours .hours');
                                var minutesContainer = document.querySelector('.countdownminutes .minutes');
                                var secondsContainer = document.querySelector('.countdownseconds .seconds');
                                
                                function updateCountdown() {
                                    var now = new Date();
                                    var nextMidnight = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1);
                                    var distance = nextMidnight - now;
                                    
                                    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                                    
                                    hours = hours < 10 ? '0' + hours : hours;
                                    minutes = minutes < 10 ? '0' + minutes : minutes;
                                    seconds = seconds < 10 ? '0' + seconds : seconds;
                                    
                                    if (hoursContainer) hoursContainer.textContent = hours;
                                    if (minutesContainer) minutesContainer.textContent = minutes;
                                    if (secondsContainer) secondsContainer.textContent = seconds;
                                }
                                
                                updateCountdown();
                                setInterval(updateCountdown, 1000);
                            }

                            document.addEventListener('DOMContentLoaded', initDailyCountdown);

                           
                        </script>
                {* Okay *}
                {include file="scripts.tpl"}
                <script src="design/{$settings->theme}/js/okay.js?v=4"></script>


                <!-- Подключение CSS для Select2 -->


                {*template scripts*}
                  {include file='contact.tpl'}

<script>
    $(document).ready(function(){
    var lazyLoadInstance = new LazyLoad({
  // Your custom settings go here
                            });
    });
</script>


<!-- jQuery (Select2 зависит от jQuery) -->

<!-- Подключение JS для Select2 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
  </div>
</body>
</html>
