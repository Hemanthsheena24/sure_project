const mongoose = require('mongoose');
const Product = require('../models/Product');
require('dotenv').config();

const mongoURI = process.env.MONGO_URI || 'mongodb://admin:password123@localhost:27017/shopkart?authSource=admin';

const sampleProducts = [
  {
    name: 'Smartphone XYZ Pro',
    description: 'Experience lightning-fast performance with 8GB RAM, 128GB Storage, and 64MP Camera',
    price: 12999,
    originalPrice: 16999,
    discount: 23,
    image: 'https://www.oppo.com/content/dam/oppo/common/mkt/v2-2/reno12-f-en/listpage/427-600-green.png',
    category: 'Mobiles',
    stock: 50,
    rating: 4.5,
  },
  {
    name: 'Noise Cancelling Headphones',
    description: 'Premium sound quality with active noise cancellation and 30-hour battery',
    price: 2499,
    originalPrice: 4999,
    discount: 50,
    image: 'https://tse2.mm.bing.net/th/id/OIP.diQ0mZXVgP1hEVLVYBGekQHaKR?pid=Api&P=0&h=180',
    category: 'Accessories',
    stock: 100,
    rating: 4.2,
  },
  {
    name: 'Smart Watch Pro',
    description: 'Feature-rich smartwatch with heart rate monitor and 7-day battery life',
    price: 3999,
    originalPrice: 5999,
    discount: 33,
    image: 'https://www.bhphotovideo.com/images/images2500x2500/apple_mj362ll_a_apple_watch_38mm_smartwatch_1293065.jpg',
    category: 'Accessories',
    stock: 75,
    rating: 4.3,
  },
  {
    name: 'LED TV 55"',
    description: '4K Ultra HD LED TV with HDR and Smart TV features',
    price: 25499,
    originalPrice: 34999,
    discount: 27,
    image: 'https://tse1.mm.bing.net/th/id/OIP.TLNW7bhM28dskskUk6yDeAHaEP?pid=Api&P=0&h=180',
    category: 'Electronics',
    stock: 30,
    rating: 4.1,
  },
  {
    name: 'Gaming Laptop',
    description: 'High-performance gaming laptop with RTX 3060 and 144Hz display',
    price: 89999,
    originalPrice: 119999,
    discount: 25,
    image: 'https://tse3.mm.bing.net/th/id/OIP.t4OkiO6Ce3xJ1JEv54GOyAHaFS?pid=Api&P=0&h=180',
    category: 'Laptops',
    stock: 25,
    rating: 4.6,
  },
  {
    name: 'Wireless Earbuds',
    description: 'True wireless earbuds with 24-hour battery and premium sound',
    price: 1299,
    originalPrice: 2299,
    discount: 43,
    image: 'https://tse2.mm.bing.net/th/id/OIP.bhX2o_QsGD8AFBjB3rFHvAHaEK?pid=Api&P=0&h=180',
    category: 'Accessories',
    stock: 150,
    rating: 4.4,
  },
];

async function initializeDatabase() {
  try {
    await mongoose.connect(mongoURI);
    console.log('MongoDB Connected');

    // Clear existing products
    await Product.deleteMany({});
    console.log('Cleared existing products');

    // Insert sample products
    await Product.insertMany(sampleProducts);
    console.log('Sample products inserted successfully');

    console.log('Database initialization complete!');
    process.exit(0);
  } catch (error) {
    console.error('Error initializing database:', error);
    process.exit(1);
  }
}

initializeDatabase();
