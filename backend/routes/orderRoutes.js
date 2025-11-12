const express = require('express');
const router = express.Router();
const Order = require('../models/Order');
const Cart = require('../models/Cart');
const User = require('../models/User');

// Create order
router.post('/:userId', async (req, res) => {
  try {
    const { deliveryAddress, paymentMethod } = req.body;
    const cart = await Cart.findOne({ user: req.params.userId }).populate(
      'items.product'
    );

    if (!cart || cart.items.length === 0) {
      return res.status(400).json({ error: 'Cart is empty' });
    }

    const discount = cart.totalPrice * 0.07;
    const deliveryCharges = cart.totalPrice > 1000 ? 0 : 50;
    const totalAmount = cart.totalPrice - discount + deliveryCharges;

    const order = new Order({
      user: req.params.userId,
      items: cart.items,
      deliveryAddress,
      paymentMethod,
      totalAmount,
      discount,
      deliveryCharges,
      status: 'pending',
    });

    await order.save();

    // Clear cart after order
    cart.items = [];
    cart.totalPrice = 0;
    await cart.save();

    res.status(201).json({
      message: 'Order created successfully',
      order,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get user orders
router.get('/user/:userId', async (req, res) => {
  try {
    const orders = await Order.find({ user: req.params.userId }).populate(
      'items.product'
    );
    res.json(orders);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get single order
router.get('/:orderId', async (req, res) => {
  try {
    const order = await Order.findById(req.params.orderId).populate(
      'items.product'
    );
    if (!order) {
      return res.status(404).json({ error: 'Order not found' });
    }
    res.json(order);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update order status (Admin only)
router.put('/:orderId', async (req, res) => {
  try {
    const { status } = req.body;
    const order = await Order.findByIdAndUpdate(
      req.params.orderId,
      { status },
      { new: true }
    );

    if (!order) {
      return res.status(404).json({ error: 'Order not found' });
    }

    res.json({ message: 'Order updated successfully', order });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
