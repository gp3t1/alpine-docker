## ALPINE BUILD SETTINGS
ARG ALPINE_TAG="3.6"

FROM alpine:${ALPINE_TAG}

LABEL maintainer="Jeremy PETIT <jeremy.petit@gmail.com>" \
			description="alpine with su-exec and tini"

## CUSTOM APPLICATION USER/GROUP
ENV APP_USER	""	APP_UID 	500 \
		APP_GROUP	""	APP_GUID 	501

RUN apk --no-cache add 	su-exec \
												tini

COPY bin/* /usr/bin/
RUN  chmod ugo+x	/usr/bin/launch \
								 	/usr/bin/setAppUser \
	&& chmod o-w 	/usr/bin/*

ENTRYPOINT ["/usr/bin/launch"]
