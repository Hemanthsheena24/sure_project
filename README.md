# ShopKart - E-commerce Platform

A full-stack e-commerce application with frontend, backend API, and MongoDB database, all containerized with Docker.

## Project Structure

```
trying/
├── frontend/
│   ├── abc.html
│   ├── cart.html
│   ├── checkout.html
│   ├── home.html
│   ├── product.html
│   ├── SPP.html
│   ├── script.js
│   ├── style.css
│   ├── success.html
│   └── Dockerfile
├── backend/
│   ├── models/
│   │   ├── User.js
│   │   ├── Product.js
│   │   ├── Cart.js
│   │   └── Order.js
│   ├── routes/
│   │   ├── userRoutes.js
│   │   ├── productRoutes.js
│   │   ├── cartRoutes.js
│   │   └── orderRoutes.js
│   ├── server.js
│   ├── package.json
│   ├── .env
│   ├── .gitignore
│   └── Dockerfile
├── docker-compose.yaml
└── README.md
```

## Features

### Frontend
- Responsive e-commerce UI
- Product browsing and search
- Shopping cart functionality
- User authentication (login/register)
- Checkout process
- Order confirmation

### Backend
- Node.js/Express REST API
- MongoDB database with Mongoose ODM
- User authentication with JWT
- Product management
- Shopping cart operations
- Order processing
- Comprehensive error handling

### Database
- MongoDB for data persistence
- Mongoose for schema validation
- Support for Users, Products, Carts, and Orders

### DevOps
- Docker containers for all services
- Docker Compose for multi-container orchestration
- Mongo Express for database administration
- Health checks for all services
- Volume management for data persistence

## Getting Started

### Prerequisites
- Docker and Docker Compose installed
- Basic knowledge of terminal/command line

### Installation & Running

1. **Navigate to project root:**
   ```bash
   cd trying
   ```

2. **Start all services:**
   ```bash
   docker-compose up -d
   ```

3. **Services will be available at:**
   - **Frontend:** http://localhost:8080
   - **Backend API:** http://localhost:5000
   - **Mongo Express:** http://localhost:8081
     - Username: admin
     - Password: admin
   - **MongoDB:** localhost:27017

4. **View logs:**
   ```bash
   docker-compose logs -f
   ```

5. **Stop all services:**
   ```bash
   docker-compose down
   ```

## API Endpoints

### Users
- `POST /api/users/register` - Register new user
- `POST /api/users/login` - User login
- `GET /api/users/profile/:userId` - Get user profile
- `PUT /api/users/profile/:userId` - Update user profile

### Products
- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get single product
- `GET /api/products/category/:category` - Get products by category
- `POST /api/products` - Create product (Admin)
- `PUT /api/products/:id` - Update product (Admin)
- `DELETE /api/products/:id` - Delete product (Admin)

### Cart
- `GET /api/cart/:userId` - Get user cart
- `POST /api/cart/:userId` - Add item to cart
- `PUT /api/cart/:userId/:productId` - Update cart item quantity
- `DELETE /api/cart/:userId/:productId` - Remove item from cart

### Orders
- `POST /api/orders/:userId` - Create order
- `GET /api/orders/user/:userId` - Get user orders
- `GET /api/orders/:orderId` - Get single order
- `PUT /api/orders/:orderId` - Update order status (Admin)

## Environment Variables

### Backend (.env)
```
MONGO_URI=mongodb://admin:password123@mongo:27017/shopkart?authSource=admin
PORT=5000
JWT_SECRET=your_jwt_secret_key_here
```

## Database Models

### User
- name, email, password, phone, address, city, pincode
- Timestamps included

### Product
- name, description, price, originalPrice, discount, image
- category (Mobiles, Laptops, Fashion, Grocery, Accessories)
- stock, rating, reviews

### Cart
- user (reference to User)
- items (array of products with quantity)
- totalPrice

### Order
- user (reference to User)
- items (array of products with quantity and price)
- deliveryAddress
- paymentMethod (upi, card, cod)
- totalAmount, discount, deliveryCharges
- status (pending, confirmed, shipped, delivered, cancelled)

## Docker Services

1. **mongo** - MongoDB database
   - Port: 27017
   - Auth: admin/password123
   - Data persistence: mongo_data volume

2. **mongo-express** - MongoDB admin interface
   - Port: 8081
   - Access: http://localhost:8081
   - Credentials: admin/admin

3. **backend** - Node.js API server
   - Port: 5000
   - Depends on: mongo (healthy)
   - Hot reload with nodemon

4. **frontend** - Static file server
   - Port: 8080
   - Served with http-server

## Development

### Running locally (without Docker)

1. **Backend:**
   ```bash
   cd backend
   npm install
   npm run dev
   ```

2. **Frontend:**
   - Open HTML files directly in browser or use a local server

### Rebuilding Docker images:
```bash
docker-compose build
```

### View database:
1. Open http://localhost:8081
2. Login with admin/admin
3. Navigate to shopkart database

## Troubleshooting

### Port already in use
Change the port mapping in docker-compose.yaml:
```yaml
ports:
  - "8080:8080"  # Change first number to different port
```

### MongoDB connection issues
Ensure mongo container is healthy:
```bash
docker-compose ps
docker logs shopkart-mongo
```

### Clear everything and restart
```bash
docker-compose down -v  # Removes volumes too
docker-compose up -d
```

## Future Enhancements

- User authentication UI integration
- Payment gateway integration
- Real-time order tracking
- Email notifications
- Admin dashboard
- Product reviews and ratings
- Search and filter functionality
- Inventory management

## License

ISC

## Author

ShopKart Development Team
