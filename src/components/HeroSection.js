import React from 'react';
import '../App.css';
import { Button } from './Button';
import './HeroSection.css';

function HeroSection() {
  return (
    <div className='hero-container'>
      <video src='/videos/video-1.mp4' autoPlay loop muted />
      <h1>DevOps 01 Project4</h1>
      <p>김휘천, 주형우, 최재혁, 최찬회</p>
      <div className='hero-btns'>

        <Button
          className='btns'
          buttonStyle='btn--primary'
          buttonSize='btn--large'
          onClick={console.log('hey')}
        >
          DB로 부터 온 메세지 확인하기 <i className='far fa-play-circle' />
        </Button>
        
      </div>
    </div>
  );
}

export default HeroSection;
