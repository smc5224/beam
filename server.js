const express = require('express');
const axios = require('axios');
const jwt = require('jsonwebtoken');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 3000;

const JWT_SECRET = process.env.JWT_SECRET || 'your-secret-key';

app.use(express.json());
app.use(cors());

app.get('/', (req, res) => {
  res.send('Hello from your Flutter Backend!');
});

app.post('/api/data', (req, res) => {
  const { name } = req.body;
  if (!name) {
    return res.status(400).json({ error: 'Name is required' });
  }
  res.json({ message: `Received name: ${name}`, timestamp: new Date() });
});

app.post('/api/auth/kakao', async (req, res) => {
  try {
    const { accessToken } = req.body;
    
    if (!accessToken) {
      return res.status(400).json({ error: 'Access token is required' });
    }

    const userResponse = await axios.get('https://kapi.kakao.com/v2/user/me', {
      headers: {
        Authorization: `Bearer ${accessToken}`
      }
    });

    const userData = userResponse.data;
    
    const user = {
      id: userData.id,
      nickname: userData.properties?.nickname || '',
      email: userData.kakao_account?.email || '',
      profile_image: userData.properties?.profile_image || ''
    };

    const token = jwt.sign(
      { 
        userId: user.id,
        nickname: user.nickname,
        email: user.email
      },
      JWT_SECRET,
      { expiresIn: '24h' }
    );

    res.json({
      success: true,
      token,
      user
    });

  } catch (error) {
    console.error('Kakao login error:', error);
    
    if (error.response?.status === 401) {
      return res.status(401).json({ error: 'Invalid access token' });
    }
    
    res.status(500).json({ error: 'Internal server error' });
  }
});

const verifyToken = (req, res, next) => {
  const token = req.headers.authorization?.split(' ')[1];
  
  if (!token) {
    return res.status(401).json({ error: 'No token provided' });
  }

  try {
    const decoded = jwt.verify(token, JWT_SECRET);
    req.user = decoded;
    next();
  } catch (error) {
    return res.status(401).json({ error: 'Invalid token' });
  }
};

app.get('/api/auth/me', verifyToken, (req, res) => {
  res.json({
    success: true,
    user: req.user
  });
});

app.listen(port, () => {
  console.log(`Backend server listening at http://localhost:${port}`);
});