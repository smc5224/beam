const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

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

app.listen(port, () => {
  console.log(`Backend server listening at http://localhost:${port}`);
});