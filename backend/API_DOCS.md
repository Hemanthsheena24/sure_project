# ShopKart Backend Documentation

## Quick Start

### Using Docker (Recommended)
```bash
cd trying
docker-compose up -d
```

### Local Setup
```bash
cd backend
npm install
npm start
```

## API Documentation

### Base URL
- **Docker:** `http://localhost:5000/api`
- **Local:** `http://localhost:5000/api`

## Endpoints

### Authentication Endpoints

#### Register User
```
POST /users/register
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123"
}

Response:
{
  "message": "User registered successfully",
  "token": "eyJhbGc...",
  "user": {
    "id": "507f1f77bcf86cd799439011",
    "name": "John Doe",
    "email": "john@example.com"
  }
}
```

#### Login User
```
POST /users/login
Content-Type: application/json

{
  "email": "john@example.com",
  "password": "password123"
}

Response:
{
  "message": "Login successful",
  "token": "eyJhbGc...",
  "user": {
    "id": "507f1f77bcf86cd799439011",
    "name": "John Doe",
    "email": "john@example.com"
  }
}
```

### Product Endpoints

#### Get All Products
```
GET /products

Response:
[
  {
    "_id": "507f1f77bcf86cd799439011",
    "name": "Smartphone XYZ Pro",
    "price": 12999,
    "category": "Mobiles",
    "stock": 50,
    ...
  }
]
```

#### Get Product by Category
```
GET /products/category/Mobiles

Response: [Product array filtered by category]
```

#### Get Single Product
```
GET /products/:productId

Response:
{
  "_id": "507f1f77bcf86cd799439011",
  "name": "Smartphone XYZ Pro",
  "description": "Experience lightning-fast performance...",
  "price": 12999,
  "originalPrice": 16999,
  "discount": 23,
  "image": "https://...",
  "category": "Mobiles",
  "stock": 50,
  "rating": 4.5
}
```

### Cart Endpoints

#### Get User Cart
```
GET /cart/:userId

Response:
{
  "_id": "507f1f77bcf86cd799439012",
  "user": "507f1f77bcf86cd799439011",
  "items": [
    {
      "product": {...},
      "quantity": 2,
      "price": 12999
    }
  ],
  "totalPrice": 25998
}
```

#### Add Item to Cart
```
POST /cart/:userId
Content-Type: application/json

{
  "productId": "507f1f77bcf86cd799439011",
  "quantity": 1
}

Response:
{
  "message": "Item added to cart",
  "cart": {...}
}
```

#### Update Cart Item Quantity
```
PUT /cart/:userId/:productId
Content-Type: application/json

{
  "quantity": 3
}

Response:
{
  "message": "Cart updated successfully",
  "cart": {...}
}
```

#### Remove Item from Cart
```
DELETE /cart/:userId/:productId

Response:
{
  "message": "Item removed from cart",
  "cart": {...}
}
```

### Order Endpoints

#### Create Order
```
POST /orders/:userId
Content-Type: application/json

{
  "deliveryAddress": {
    "name": "John Doe",
    "phone": "9876543210",
    "address": "House no 123, Street name",
    "city": "Delhi",
    "pincode": "110001"
  },
  "paymentMethod": "upi"
}

Response:
{
  "message": "Order created successfully",
  "order": {
    "_id": "507f1f77bcf86cd799439013",
    "user": "507f1f77bcf86cd799439011",
    "items": [...],
    "totalAmount": 26548,
    "status": "pending",
    "createdAt": "2024-11-11T10:30:00.000Z"
  }
}
```

#### Get User Orders
```
GET /orders/user/:userId

Response:
[
  {
    "_id": "507f1f77bcf86cd799439013",
    "user": "507f1f77bcf86cd799439011",
    "status": "pending",
    "totalAmount": 26548,
    "createdAt": "2024-11-11T10:30:00.000Z"
  }
]
```

#### Get Single Order
```
GET /orders/:orderId

Response:
{
  "_id": "507f1f77bcf86cd799439013",
  "user": "507f1f77bcf86cd799439011",
  "items": [...],
  "deliveryAddress": {...},
  "paymentMethod": "upi",
  "totalAmount": 26548,
  "status": "pending"
}
```

#### Update Order Status
```
PUT /orders/:orderId
Content-Type: application/json

{
  "status": "shipped"
}

Response:
{
  "message": "Order updated successfully",
  "order": {...}
}
```

## Database Seeding

To populate the database with sample products:

```bash
cd backend
node scripts/seedDatabase.js
```

This will add 6 sample products across different categories.

## Environment Variables

Create a `.env` file in the backend directory:

```
MONGO_URI=mongodb://admin:password123@mongo:27017/shopkart?authSource=admin
PORT=5000
JWT_SECRET=your_jwt_secret_key_here
```

## Error Handling

All endpoints return error responses in this format:

```json
{
  "error": "Error message describing what went wrong"
}
```

Status codes:
- `200` - Success
- `201` - Created
- `400` - Bad Request
- `401` - Unauthorized
- `404` - Not Found
- `500` - Server Error

## Testing with cURL or Postman

### Register:
```bash
curl -X POST http://localhost:5000/api/users/register \
  -H "Content-Type: application/json" \
  -d '{"name":"John","email":"john@test.com","password":"pass123"}'
```

### Get All Products:
```bash
curl http://localhost:5000/api/products
```

### Add to Cart:
```bash
curl -X POST http://localhost:5000/api/cart/507f1f77bcf86cd799439011 \
  -H "Content-Type: application/json" \
  -d '{"productId":"507f1f77bcf86cd799439011","quantity":1}'
```

## Security Notes

1. Always use HTTPS in production
2. Implement proper JWT verification middleware
3. Add rate limiting
4. Sanitize all user inputs
5. Use environment variables for sensitive data
6. Implement CORS properly for production

## MongoDB Collections

The database automatically creates these collections:

- **users** - User accounts and profiles
- **products** - Product catalog
- **carts** - Shopping carts
- **orders** - Order history

Each document has `createdAt` and `updatedAt` timestamps automatically managed by Mongoose.
