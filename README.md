# Frontend

## 프로젝트 목표
실제 회사처럼 프론트, api서버, auth서버 3가지팀이 개별적으로 존재한다고 (local/dev/staging/production) 각 개별 환경별 배포 자동화를 마치고 staging/production 환경에서는 쿠버네티스를 이용한 오케스트레이션을 완성시키는게 목표

## 시스템 아키텍쳐
(사진필요)

## 배포 파이프라인
(사진 필요)

## getting started
개별테스트를 위한 사전 설치 mac, ubuntu 적어줄것

## 기능설명
- 파이프라인을 통해 branch를 구분하여 dev환경에서 프론트환경과 main(staging/production)에서 프론트환경을 구분하여 dev.도메인, staging.도메인으로 분리하여 관리가 가능하게끔 했음 
- 배포파이프라인에 클라우드워치 알림을 추가하여 slack에서 배포가 잘되었는지 확인 가능함

## terraform iac(front)
codepipeline, iam, s3

## 명령어
- dev환경 : https://dev.devops-altf4.click/
- staging/productiong환경 : https://staging.devops-altf4.click/

## out put
(홈페이지)


## 기술 스택
aws, git, git action
