# ShopKart - Complete Setup Guide

## 📋 Project Overview

ShopKart is a full-stack e-commerce application with:
- **Frontend**: Responsive HTML/CSS/JS shopping interface
- **Backend**: Node.js/Express REST API
- **Database**: MongoDB with Mongoose ODM
- **Admin UI**: Mongo Express for database management
- **Containerization**: Docker & Docker Compose

---

## 🚀 Quick Start (with Docker)

### Step 1: Prerequisites
- Install [Docker](https://www.docker.com/products/docker-desktop)
- Install [Docker Compose](https://docs.docker.com/compose/install/)
- Verify installation:
  ```bash
  docker --version
  docker-compose --version
  ```

### Step 2: Navigate to Project
```bash
cd trying
```

### Step 3: Start All Services
```bash
docker-compose up -d
```

### Step 4: Verify Services
```bash
docker-compose ps
```

You should see 4 running containers:
- shopkart-mongo
- shopkart-mongo-express
- shopkart-backend
- shopkart-frontend

### Step 5: Access Applications
| Service | URL | Credentials |
|---------|-----|-------------|
| Frontend | http://localhost:8080 | - |
| Backend API | http://localhost:5000/api | - |
| Mongo Express | http://localhost:8081 | admin / admin |
| MongoDB | localhost:27017 | admin / password123 |

---

## 📁 Project Structure

```
trying/
├── frontend/                    # Web UI
│   ├── abc.html                # Login/Register page
│   ├── home.html               # Home page
│   ├── product.html            # Product details
│   ├── cart.html               # Shopping cart
│   ├── checkout.html           # Checkout page
│   ├── success.html            # Order confirmation
│   ├── SPP.html                # Single product page
│   ├── script.js               # Frontend JavaScript
│   ├── style.css               # Styling
│   └── Dockerfile              # Docker configuration
│
├── backend/                     # REST API
│   ├── models/
│   │   ├── User.js             # User schema
│   │   ├── Product.js          # Product schema
│   │   ├── Cart.js             # Cart schema
│   │   └── Order.js            # Order schema
│   │
│   ├── routes/
│   │   ├── userRoutes.js       # User endpoints
│   │   ├── productRoutes.js    # Product endpoints
│   │   ├── cartRoutes.js       # Cart endpoints
│   │   └── orderRoutes.js      # Order endpoints
│   │
│   ├── middleware/
│   │   └── authMiddleware.js   # JWT authentication
│   │
│   ├── scripts/
│   │   └── seedDatabase.js     # Database initialization
│   │
│   ├── server.js               # Express app entry point
│   ├── package.json            # Dependencies
│   ├── .env                    # Environment variables
│   ├── .gitignore              # Git ignore rules
│   ├── Dockerfile              # Docker configuration
│   ├── API_DOCS.md             # API documentation
│   └── SETUP.md                # Setup guide
│
├── docker-compose.yaml         # Multi-container setup
├── README.md                   # Project overview
└── STARTUP.md                  # This file
```

---

## 🔧 Manual Setup (Without Docker)

### Backend Setup

#### 1. Install Node.js
- Download from [nodejs.org](https://nodejs.org/)
- Verify: `node --version` and `npm --version`

#### 2. Install MongoDB
- Download from [mongodb.com](https://www.mongodb.com/try/download/community)
- Or use MongoDB Atlas (cloud): [atlas.mongodb.com](https://www.mongodb.com/cloud/atlas)

#### 3. Backend Installation
```bash
cd backend
npm install
```

#### 4. Configure Environment
Create `.env` file in backend directory:
```
MONGO_URI=mongodb://localhost:27017/shopkart
PORT=5000
JWT_SECRET=your_secret_key_here
```

#### 5. Seed Database (Optional)
```bash
npm run seed
```

#### 6. Start Backend
```bash
npm start
# or for development with auto-reload:
npm run dev
```

Backend runs on: `http://localhost:5000`

### Frontend Setup

#### 1. Start a Local Server
Option 1 - Using Python:
```bash
# Python 3
cd frontend
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

Option 2 - Using Node.js:
```bash
npm install -g http-server
cd frontend
http-server -p 8080
```

Option 3 - Using VS Code Live Server extension

Frontend runs on: `http://localhost:8000` (or 8080)

---

## 📚 API Documentation

### Health Check
```bash
curl http://localhost:5000/api/health
```

### User Authentication

#### Register
```bash
curl -X POST http://localhost:5000/api/users/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123"
  }'
```

#### Login
```bash
curl -X POST http://localhost:5000/api/users/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john@example.com",
    "password": "password123"
  }'
```

### Products

#### Get All Products
```bash
curl http://localhost:5000/api/products
```

#### Get Products by Category
```bash
curl http://localhost:5000/api/products/category/Mobiles
```

### Cart Operations

#### Add Item to Cart
```bash
curl -X POST http://localhost:5000/api/cart/USER_ID \
  -H "Content-Type: application/json" \
  -d '{
    "productId": "PRODUCT_ID",
    "quantity": 1
  }'
```

#### Get Cart
```bash
curl http://localhost:5000/api/cart/USER_ID
```

### Orders

#### Create Order
```bash
curl -X POST http://localhost:5000/api/orders/USER_ID \
  -H "Content-Type: application/json" \
  -d '{
    "deliveryAddress": {
      "name": "John Doe",
      "phone": "9876543210",
      "address": "123 Main St",
      "city": "Delhi",
      "pincode": "110001"
    },
    "paymentMethod": "upi"
  }'
```

---

## 🐳 Docker Commands

### View Running Containers
```bash
docker-compose ps
```

### View Logs
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f backend
docker-compose logs -f mongo
docker-compose logs -f frontend
```

### Stop Services
```bash
docker-compose down
```

### Stop and Remove Volumes
```bash
docker-compose down -v
```

### Rebuild Images
```bash
docker-compose build
docker-compose up -d
```

### Access Container Shell
```bash
docker-compose exec backend sh
docker-compose exec mongo mongosh
```

---

## 💾 Database Management

### Using Mongo Express (Web UI)
1. Go to http://localhost:8081
2. Login: **admin** / **admin**
3. Navigate to **shopkart** database
4. View/Edit collections

### Using MongoDB CLI
```bash
# Access MongoDB shell inside Docker
docker-compose exec mongo mongosh -u admin -p password123

# Inside the shell:
use shopkart
db.users.find()
db.products.find()
db.orders.find()
```

### Sample Data
Insert sample products:
```bash
# Inside Docker
docker-compose exec backend npm run seed

# Or without Docker
cd backend
npm run seed
```

---

## ⚙️ Configuration

### Backend Configuration (.env)
```
# MongoDB Connection
MONGO_URI=mongodb://admin:password123@mongo:27017/shopkart?authSource=admin

# Server Port
PORT=5000

# JWT Secret Key
JWT_SECRET=your_jwt_secret_key_here

# Node Environment
NODE_ENV=development
```

### Docker Compose Configuration
Edit `docker-compose.yaml` to:
- Change port mappings
- Modify environment variables
- Add/remove services
- Adjust resource limits

---

## 🛠️ Troubleshooting

### Port Already in Use
If port 8080, 5000, etc. is already in use:

1. Find the process using the port:
   ```bash
   # Windows
   netstat -ano | findstr :8080
   
   # Mac/Linux
   lsof -i :8080
   ```

2. Change port in `docker-compose.yaml`:
   ```yaml
   ports:
     - "3000:5000"  # Change 3000 to available port
   ```

3. Restart: `docker-compose up -d`

### MongoDB Connection Issues
```bash
# Check mongo container
docker-compose logs mongo

# Verify mongo is running
docker-compose ps mongo

# Restart mongo
docker-compose restart mongo
```

### Backend Not Connecting to DB
- Ensure MongoDB is running
- Check `MONGO_URI` in `.env`
- Verify network connectivity: `docker-compose exec backend npm start`

### Frontend Can't Reach Backend
- Check backend is running: `curl http://localhost:5000/api/health`
- Update API endpoint in frontend if needed
- Check CORS settings in backend

### Clear Everything and Start Fresh
```bash
# Stop and remove all containers and volumes
docker-compose down -v

# Remove images
docker-compose down --rmi all

# Start fresh
docker-compose up -d
```

---

## 📖 Additional Resources

### Documentation Files
- **README.md** - Project overview
- **API_DOCS.md** - Detailed API documentation
- **backend/SETUP.md** - Backend specific setup

### Technologies Used
- **Frontend**: HTML5, CSS3, JavaScript
- **Backend**: Node.js, Express.js
- **Database**: MongoDB, Mongoose
- **Admin**: Mongo Express
- **DevOps**: Docker, Docker Compose

### Learning Resources
- [Express.js Guide](https://expressjs.com/)
- [MongoDB Documentation](https://docs.mongodb.com/)
- [Mongoose ODM](https://mongoosejs.com/)
- [Docker Documentation](https://docs.docker.com/)

---

## 🚀 Next Steps

### Frontend Integration
Update API endpoints in frontend files to point to backend:
```javascript
const API_URL = 'http://localhost:5000/api';
```

### Add More Features
- User authentication UI
- Real-time notifications
- Payment gateway integration
- Admin dashboard
- Product reviews
- Search functionality

### Production Deployment
- Use environment-specific configurations
- Implement proper error handling
- Add monitoring and logging
- Use a reverse proxy (Nginx)
- Enable HTTPS/SSL
- Set up CI/CD pipeline

---

## 📞 Support

For issues:
1. Check logs: `docker-compose logs -f`
2. Review troubleshooting section
3. Check API documentation
4. Verify environment variables
5. Ensure all services are running

---

## ✅ Verification Checklist

After startup, verify:
- [ ] All 4 containers running (`docker-compose ps`)
- [ ] Frontend loads at http://localhost:8080
- [ ] Backend responds at http://localhost:5000/api/health
- [ ] Mongo Express accessible at http://localhost:8081
- [ ] MongoDB has shopkart database
- [ ] Can view products at http://localhost:5000/api/products
- [ ] Sample products exist in database

---

## 📝 Version Info

- Node.js: 18.x
- MongoDB: 6.0
- Express: 4.18+
- Docker: Latest
- Docker Compose: 3.8

---

**Happy Shopping with ShopKart! 🛒**
