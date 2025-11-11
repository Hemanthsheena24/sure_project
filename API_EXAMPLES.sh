#!/bin/bash

# ShopKart API - cURL Testing Examples
# ====================================
#
# Usage: Save this file and run individual curl commands to test the API
# Requires: curl installed, ShopKart running on localhost
#
# Base URL: http://localhost:5000/api

echo "ShopKart API Testing Guide"
echo "============================"
echo ""
echo "Note: These are example commands. Adjust IDs and values as needed."
echo ""

# ========== HEALTH CHECK ==========
echo "1. HEALTH CHECK"
echo "==============="
echo "GET http://localhost:5000/api/health"
echo ""
echo "curl http://localhost:5000/api/health"
echo ""
echo ""

# ========== AUTHENTICATION ==========
echo "2. USER REGISTRATION"
echo "===================="
echo "POST http://localhost:5000/api/users/register"
echo ""
echo 'curl -X POST http://localhost:5000/api/users/register \'
echo '  -H "Content-Type: application/json" \'
echo '  -d '"'"'{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123"
}'"'"
echo ""
echo ""

echo "3. USER LOGIN"
echo "============="
echo "POST http://localhost:5000/api/users/login"
echo ""
echo 'curl -X POST http://localhost:5000/api/users/login \'
echo '  -H "Content-Type: application/json" \'
echo '  -d '"'"'{
  "email": "john@example.com",
  "password": "password123"
}'"'"
echo ""
echo ""

echo "4. GET USER PROFILE"
echo "===================="
echo "GET http://localhost:5000/api/users/profile/USER_ID"
echo ""
echo 'curl http://localhost:5000/api/users/profile/507f1f77bcf86cd799439011'
echo ""
echo ""

echo "5. UPDATE USER PROFILE"
echo "======================"
echo "PUT http://localhost:5000/api/users/profile/USER_ID"
echo ""
echo 'curl -X PUT http://localhost:5000/api/users/profile/507f1f77bcf86cd799439011 \'
echo '  -H "Content-Type: application/json" \'
echo '  -d '"'"'{
  "phone": "9876543210",
  "address": "123 Main Street",
  "city": "Delhi",
  "pincode": "110001"
}'"'"
echo ""
echo ""

# ========== PRODUCTS ==========
echo "6. GET ALL PRODUCTS"
echo "==================="
echo "GET http://localhost:5000/api/products"
echo ""
echo 'curl http://localhost:5000/api/products'
echo ""
echo ""

echo "7. GET PRODUCTS BY CATEGORY"
echo "==========================="
echo "GET http://localhost:5000/api/products/category/CATEGORY"
echo ""
echo 'curl http://localhost:5000/api/products/category/Mobiles'
echo ""
echo "Available categories:"
echo "  - Mobiles"
echo "  - Laptops"
echo "  - Fashion"
echo "  - Grocery"
echo "  - Accessories"
echo ""
echo ""

echo "8. GET SINGLE PRODUCT"
echo "===================="
echo "GET http://localhost:5000/api/products/PRODUCT_ID"
echo ""
echo 'curl http://localhost:5000/api/products/507f1f77bcf86cd799439011'
echo ""
echo ""

echo "9. CREATE PRODUCT (Admin)"
echo "========================="
echo "POST http://localhost:5000/api/products"
echo ""
echo 'curl -X POST http://localhost:5000/api/products \'
echo '  -H "Content-Type: application/json" \'
echo '  -d '"'"'{
  "name": "New Product",
  "description": "Product description",
  "price": 9999,
  "originalPrice": 12999,
  "discount": 23,
  "image": "https://example.com/image.jpg",
  "category": "Mobiles",
  "stock": 100,
  "rating": 4.5
}'"'"
echo ""
echo ""

echo "10. UPDATE PRODUCT (Admin)"
echo "=========================="
echo "PUT http://localhost:5000/api/products/PRODUCT_ID"
echo ""
echo 'curl -X PUT http://localhost:5000/api/products/507f1f77bcf86cd799439011 \'
echo '  -H "Content-Type: application/json" \'
echo '  -d '"'"'{
  "price": 8999,
  "stock": 50
}'"'"
echo ""
echo ""

echo "11. DELETE PRODUCT (Admin)"
echo "=========================="
echo "DELETE http://localhost:5000/api/products/PRODUCT_ID"
echo ""
echo 'curl -X DELETE http://localhost:5000/api/products/507f1f77bcf86cd799439011'
echo ""
echo ""

# ========== CART ==========
echo "12. GET USER CART"
echo "================="
echo "GET http://localhost:5000/api/cart/USER_ID"
echo ""
echo 'curl http://localhost:5000/api/cart/507f1f77bcf86cd799439011'
echo ""
echo ""

echo "13. ADD ITEM TO CART"
echo "===================="
echo "POST http://localhost:5000/api/cart/USER_ID"
echo ""
echo 'curl -X POST http://localhost:5000/api/cart/507f1f77bcf86cd799439011 \'
echo '  -H "Content-Type: application/json" \'
echo '  -d '"'"'{
  "productId": "507f1f77bcf86cd799439011",
  "quantity": 2
}'"'"
echo ""
echo ""

echo "14. UPDATE CART ITEM QUANTITY"
echo "=============================="
echo "PUT http://localhost:5000/api/cart/USER_ID/PRODUCT_ID"
echo ""
echo 'curl -X PUT http://localhost:5000/api/cart/507f1f77bcf86cd799439011/507f1f77bcf86cd799439011 \'
echo '  -H "Content-Type: application/json" \'
echo '  -d '"'"'{
  "quantity": 5
}'"'"
echo ""
echo ""

echo "15. REMOVE ITEM FROM CART"
echo "========================="
echo "DELETE http://localhost:5000/api/cart/USER_ID/PRODUCT_ID"
echo ""
echo 'curl -X DELETE http://localhost:5000/api/cart/507f1f77bcf86cd799439011/507f1f77bcf86cd799439011'
echo ""
echo ""

# ========== ORDERS ==========
echo "16. CREATE ORDER"
echo "================"
echo "POST http://localhost:5000/api/orders/USER_ID"
echo ""
echo 'curl -X POST http://localhost:5000/api/orders/507f1f77bcf86cd799439011 \'
echo '  -H "Content-Type: application/json" \'
echo '  -d '"'"'{
  "deliveryAddress": {
    "name": "John Doe",
    "phone": "9876543210",
    "address": "123 Main Street",
    "city": "Delhi",
    "pincode": "110001"
  },
  "paymentMethod": "upi"
}'"'"
echo ""
echo "Payment Methods: upi, card, cod"
echo ""
echo ""

echo "17. GET USER ORDERS"
echo "==================="
echo "GET http://localhost:5000/api/orders/user/USER_ID"
echo ""
echo 'curl http://localhost:5000/api/orders/user/507f1f77bcf86cd799439011'
echo ""
echo ""

echo "18. GET SINGLE ORDER"
echo "===================="
echo "GET http://localhost:5000/api/orders/ORDER_ID"
echo ""
echo 'curl http://localhost:5000/api/orders/507f1f77bcf86cd799439013'
echo ""
echo ""

echo "19. UPDATE ORDER STATUS (Admin)"
echo "==============================="
echo "PUT http://localhost:5000/api/orders/ORDER_ID"
echo ""
echo 'curl -X PUT http://localhost:5000/api/orders/507f1f77bcf86cd799439013 \'
echo '  -H "Content-Type: application/json" \'
echo '  -d '"'"'{
  "status": "shipped"
}'"'"
echo ""
echo "Order Status: pending, confirmed, shipped, delivered, cancelled"
echo ""
echo ""

# ========== PRACTICAL WORKFLOW ==========
echo "PRACTICAL WORKFLOW EXAMPLE"
echo "=========================="
echo ""
echo "1. Register a new user:"
echo 'curl -X POST http://localhost:5000/api/users/register -H "Content-Type: application/json" -d '"'"'{"name":"Alice","email":"alice@test.com","password":"pass123"}'"'"
echo ""
echo "2. Get all products:"
echo 'curl http://localhost:5000/api/products | grep -i "name"'
echo ""
echo "3. Add product to cart (replace USER_ID and PRODUCT_ID):"
echo 'curl -X POST http://localhost:5000/api/cart/USER_ID -H "Content-Type: application/json" -d '"'"'{"productId":"PRODUCT_ID","quantity":1}'"'"
echo ""
echo "4. View cart:"
echo 'curl http://localhost:5000/api/cart/USER_ID'
echo ""
echo "5. Create order:"
echo 'curl -X POST http://localhost:5000/api/orders/USER_ID -H "Content-Type: application/json" -d '"'"'{"deliveryAddress":{"name":"Alice","phone":"9876543210","address":"123 Test St","city":"Delhi","pincode":"110001"},"paymentMethod":"upi"}'"'"
echo ""
echo ""

# ========== TIPS ==========
echo "USEFUL TIPS"
echo "==========="
echo ""
echo "1. Pretty print JSON output:"
echo '   curl http://localhost:5000/api/products | python -m json.tool'
echo ""
echo "2. Save response to file:"
echo '   curl http://localhost:5000/api/products > products.json'
echo ""
echo "3. Show response headers:"
echo '   curl -i http://localhost:5000/api/health'
echo ""
echo "4. Use with Postman or Insomnia for easier testing"
echo ""
echo "5. Replace these example IDs with real IDs from your database:"
echo "   - 507f1f77bcf86cd799439011 (user ID)"
echo "   - 507f1f77bcf86cd799439013 (order ID)"
echo ""
echo ""

echo "ENVIRONMENT SETUP"
echo "================="
echo ""
echo "# Set variables in PowerShell:"
echo '$USER_ID = "your_user_id"'
echo '$PRODUCT_ID = "your_product_id"'
echo ""
echo "# Then use in commands:"
echo 'curl http://localhost:5000/api/cart/$USER_ID'
echo ""
echo ""

echo "For more information, see:"
echo "  - README.md"
echo "  - STARTUP.md"
echo "  - backend/API_DOCS.md"
