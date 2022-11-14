<?php
/* Smarty version 4.2.1, created on 2022-11-14 15:49:53
  from 'C:\xampp\htdocs\CodigoAzul\templates\header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.1',
  'unifunc' => 'content_63725591160895_91339638',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'bce812c8e055dd613d91529db5f68165f94847d6' => 
    array (
      0 => 'C:\\xampp\\htdocs\\CodigoAzul\\templates\\header.tpl',
      1 => 1668434581,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63725591160895_91339638 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codigo Azul</title>
</head>
<header>
    <img src="./images/logo.png" alt="Logo Codigo Azul">
    <?php if ($_smarty_tpl->tpl_vars['id']->value) {?>
        <p>Bienvenido <?php echo $_smarty_tpl->tpl_vars['username']->value;?>
!</p>
    <?php } else { ?>
        <a href="signin">Iniciar Sesion</a>
    <?php }?>
</header><?php }
}
