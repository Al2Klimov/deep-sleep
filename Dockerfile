FROM gcc as build
COPY main.c /
RUN ["gcc", "-Oz", "-s", "-static", "-o", "deep-sleep", "main.c"]


FROM alpine as compress
RUN ["apk", "add", "upx"]
COPY --from=build /deep-sleep /
RUN ["upx", "/deep-sleep"]


FROM scratch
COPY --from=compress /deep-sleep /
CMD ["/deep-sleep"]
