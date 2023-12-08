# Dockerfile
FROM python:3.10

WORKDIR /usr/app

#COPY requirements.txt ./

# Install Python Requirements
RUN pip install -U pip
#RUN pip install --no-cache-dir -r requirements.txt
# Install Python packages
RUN pip install --upgrade markupsafe \
    && pip install --upgrade jinja2 
RUN pip install --upgrade dbt \
    #&& pip uninstall dbt -y \
    && pip install dbt-postgres 


# Create alias for dbt-set-profile
RUN echo "alias dbt-set-profile='unset DBT_PROFILES_DIR && export DBT_PROFILES_DIR=\$PWD'" >> ~/.bashrc

CMD ["dbt", "--version"]