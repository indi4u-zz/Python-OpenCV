# Base image heroku cedar stack v14
FROM heroku/cedar:14


# Install Opencv with python bindings
RUN apt-get install -y cmake
RUN curl -s -L https://github.com/Itseez/opencv/archive/2.4.11.zip > opencv-2.4.11.zip
RUN unzip opencv-2.4.11.zip
RUN rm opencv-2.4.11.zip
WORKDIR /app/.heroku/opencv-2.4.11
RUN cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/app/.heroku/vendor -D BUILD_DOCS=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D BUILD_opencv_python=ON .
RUN make install
WORKDIR /app/.heroku
RUN rm -rf opencv-2.4.11
