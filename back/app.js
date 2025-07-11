require('dotenv').config();
console.log("✅ MONGO_URI 값:", process.env.MONGO_URI);


const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const axios = require('axios'); // ← 이거 추가 필요!

const app = express();
const port = 3000;

app.use(express.json());
app.use(cors());

// DB 연결
mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log("✅ MongoDB connected"))
  .catch(err => console.error("❌ MongoDB connection error:", err));

// 유저 모델
const User = mongoose.model('User', new mongoose.Schema({
  kakaoId: String,
  nickname: String,
  profileImage: String,
}));

// 카카오 로그인 라우트
app.post('/auth/kakao', async (req, res) => {
  const { accessToken } = req.body;

  try {
    // 카카오 사용자 정보 가져오기
    const kakaoRes = await axios.get('https://kapi.kakao.com/v2/user/me', {
      headers: {
        Authorization: `Bearer ${accessToken}`,
      },
    });

    const kakaoData = kakaoRes.data;
    const kakaoId = kakaoData.id.toString();
    const nickname = kakaoData.properties.nickname;
    const profileImage = kakaoData.properties.profile_image;

    // DB에 유저 찾거나 새로 생성
    let user = await User.findOne({ kakaoId });
    if (!user) {
      user = new User({ kakaoId, nickname, profileImage });
      await user.save();
    }

    res.json({
      message: "로그인 성공",
      user: {
        id: user._id,
        nickname: user.nickname,
        profileImage: user.profileImage,
      },
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "카카오 로그인 실패" });
  }
});

app.listen(port, () => {
  console.log(`🚀 Server running at http://localhost:${port}`);
});
