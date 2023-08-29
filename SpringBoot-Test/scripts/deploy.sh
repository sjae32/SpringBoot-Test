REPOSITORY=/home/ec2-user/web/step2
PROJECT_NAME=SpringBoot-Test
JAR_NAME=SpringBoot-Test-0.0.1-SNAPSHOT.jar

cd $REPOSITORY

# build 파일 복사
cp $REPOSITORY/$PROJECT_NAME/build/libs/*.jar $REPOSITORY/

# 현재 구동중인 pid 확인
CURRENT_PID=$(pgrep -f ${PROJECT_NAME}.*.jar)

# 현재 구동중인 pid가 있으면 프로세스 종료
if [ -z "$CURRENT_PID" ]; then
	echo "구동중인 프로세스가 없음"
else
	echo "CURRENT_PID 프로세스 종료"
	kill -15 $CURRENT_PID
	sleep 5
fi

# 애플리케이션 배포
nohup java -jar -Dspring.config.location=classpath:/application.yml,\
$REPOSITORY/application-real-db.yml \
$REPOSITORY/$JAR_NAME > $REPOSITORY/nohup.out 2>&1 &