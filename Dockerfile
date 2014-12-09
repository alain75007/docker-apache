From alain75007/debian
MAINTAINER Alain Beauvois <alain@questioncode.fr>

RUN apt-get -y update  && apt-get -y upgrade && apt-get -y install supervisor pwgen apache2 php5 php5-mysql php5-gd curl 

RUN a2enmod rewrite

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php5/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php5/apache2/php.ini

EXPOSE 80

CMD /usr/sbin/apachectl -D 'FOREGROUND'
