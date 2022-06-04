# Frontend

## 프로젝트 목표
실제 회사처럼 프론트, api서버, auth서버 3가지팀이 개별적으로 존재한다고 (local/dev/staging/production) 각 개별 환경별 배포 자동화를 마치고 dev환경에서는 각 개발자들의 코드를 모아 테스트 할 수 있는 환경을 제공하고, Frontend에서는 빠른 정적 웹호스팅이 요구되어 캐시처리를 해줄 Cloudfront, AWS 내 제공해주는 CI/CD 툴인 Codedeploy, S3를 활용하여 하나의 git repository 내 코드 통합 시 소스코드의 단일공급원으로의 역할을 하게 만드는 것이 목표입니다. 

## 시스템 아키텍쳐
**Staging / Production**
![스크린샷, 2022-06-04 16-34-37](https://user-images.githubusercontent.com/50416571/171989731-0b62b7ae-9427-41d6-b978-8251b764ce5c.png)


**Development**
![스크린샷, 2022-06-04 16-34-40](https://user-images.githubusercontent.com/50416571/171989729-adcb4292-a14b-4278-8140-990c7ac2749d.png)



## 배포 파이프라인
![프론트엔드 배포자동화](https://user-images.githubusercontent.com/98368480/171646167-3b9fa219-25ad-41f1-b1dc-f0265cb8ff39.png)


## getting started
개별테스트를 위한 사전 설치 mac, ubuntu 적어줄것

## 기능설명
- 파이프라인을 통해 branch를 구분하여 dev환경에서 프론트환경과 main(staging/production)에서 프론트환경을 구분하여 dev.도메인, staging.도메인으로 분리하여 관리가 가능하게끔 했음 
- 배포파이프라인에 클라우드워치 알림을 추가하여 slack에서 배포가 잘되었는지 확인 가능함

## terraform iac(front)
codepipeline, iam, s3

## API Reference
- dev : https://dev.devops-altf4.click/
- staging : https://staging.devops-altf4.click/
- Production : https://www.devops-altf4.click/
- swagger : https://app.swaggerhub.com/apis/DevOps-Altf4/Project4-altf4/1.0.0

## out put
dev
<img width="1440" alt="스크린샷 2022-06-03 오전 10 19 35" src="https://user-images.githubusercontent.com/50437623/171768660-19b0283a-1ad4-4cbd-8d39-6407c0cb86b4.png">


staging/production
<img width="1440" alt="스크린샷 2022-06-03 오전 10 17 21" src="https://user-images.githubusercontent.com/50437623/171768498-d0543fd1-c9be-4a49-b209-e832e20b99c1.png">




## 기술 스택
AWS Code pipeline, github-cli, git actions, Network, Terraform
