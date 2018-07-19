# CIS Apache HTTP Server 2.4 Benchmark v1.2.1 04-23-2015
This list is to help track which benchmarks have been implemented and which have not.

## 1.1.01 Pre-Installation Planning Checklist
not implemented

## 1.1.02 Do Not Install a Multi-use System
Dockerfile

## 1.1.03 Installing Apache
Dockerfile

## 1.2.01 Enable only necessary Authentication and Authorization Modules
not implemented

## 1.2.02 Enable the Log Config Module
not implemented, default setting

## 1.2.03 Disable WebDAV Modules
Dockerfile

## 1.2.04 Disable Status Module
Dockerfile

## 1.2.05 Disable Autoindex Module
Dockerfile, think I had to edit some other file as well to get the server to run after that

## 1.2.06 Disable Proxy Modules
Dockerfile

## 1.2.07 Disable User Directories Modules
Dockerfile

## 1.2.08 Disable Info Module
Dockerfile

## 1.3.01 Run the Apache Web Server as a non-root user
not a separate file: the Centos httpd package complies with this benchmark

## 1.3.02 Give the Apache User Account an Invalid Shell
not a separate file: the Centos httpd package complies with this benchmark

## 1.3.03 Lock the Apache User Account
not a separate file: the Centos httpd package complies with this benchmark

## 1.3.04 Set Ownership on Apache Directories and Files
not a separate file: the Centos httpd package complies with this benchmark

## 1.3.05
not a separate file: the Centos httpd package complies with this benchmark

## 1.3.06
not a separate file: the Centos httpd package complies with this benchmark

## 1.3.07
not a separate file: the Centos httpd package complies with this benchmark

## 1.3.08
not a separate file: the Centos httpd package complies with this benchmark
grep -Ri /etc/httpd, only binary matches

## 1.3.09
not a separate file: the Centos httpd package complies with this benchmark

## 1.3.10
not a separate file: the Centos httpd package complies with this benchmark

## 1.3.11
not a separate file: the Centos httpd package complies with this benchmark

## 1.3.12
not a separate file: the Centos httpd package complies with this benchmark

## 1.4.1 Deny Access to OS Root Directory
httpd.conf, phpldapadmin.conf, ssl.conf, Dockerfile

## 1.4.2 Allow Appropriate Access to Web Content
httpd.conf, phpldapadmin.conf, ssl.conf, Dockerfile

## 1.4.3 Restrict Override for the OS Root Directory

