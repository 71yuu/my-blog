/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.5.60 : Database - yuublog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yuublog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yuublog`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_user_id` int(11) unsigned DEFAULT NULL,
  `article_title` varchar(255) DEFAULT NULL,
  `article_html` mediumtext,
  `article_content` mediumtext,
  `article_view_count` int(11) DEFAULT '0',
  `article_comment_count` int(11) DEFAULT '0',
  `article_like_count` int(11) DEFAULT '0',
  `article_is_comment` int(1) unsigned DEFAULT NULL,
  `article_status` int(1) unsigned DEFAULT '1',
  `article_update_time` datetime DEFAULT NULL,
  `article_create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`article_id`,`article_user_id`,`article_title`,`article_html`,`article_content`,`article_view_count`,`article_comment_count`,`article_like_count`,`article_is_comment`,`article_status`,`article_update_time`,`article_create_time`) values 
(91,1,'IDEA 简介','## 什么是 IDEA\r\n\r\n![](http://localhost:8080/static/upload/716ec08c-d2f7-4c89-b2df-5749dc51a6b4.jpg)\r\n\r\nIDEA 全称 Intellij IDEA，是 Java 语言开发的集成环境，Intellij 在业界被公认为最好的 Java 开发工具之一，尤其是在智能代码助手、代码自动提示、重构、J2EE 支持、各类版本工具(git、svn、github 等)、JUnit、CVS 整合、代码分析、 创新的 GUI 设计等方面的功能可以说是超常的。IDEA 是 JetBrains 公司的产品，这家公司总部位于捷克共和国的首都布拉格，开发人员以严谨著称的东欧程序员为主。它的旗舰版本还支持 HTML，CSS，PHP，MySQL，Python 等。免费版只支持 Java 等少数语言。\r\n\r\n## 特色功能\r\n\r\n- 智能的选取：在很多时候我们要选取某个方法，或某个循环或想一步一步从一个变量到整个类慢慢扩充着选取，IDEA就提供这种基于语法的选择，在默认设置中 Ctrl + W，可以实现选取范围的不断扩充，这种方式在重构的时候尤其显得方便。\r\n\r\n- 丰富的导航模式：IDEA 提供了丰富的导航查看模式，例如 Ctrl + E 显示最近打开过的文件，Ctrl + N 显示你希望显示的类名查找框（该框同样有智能补充功能，当你输入字母后IDEA将显示所有候选类名）。在最基本的 Project 视图中，你还可以选择多种的视图方式。\r\n\r\n- 历史记录功能：不用通过版本管理服务器，单纯的 IDEA 就可以查看任何工程中文件的历史记录，在版本恢复时你可以很容易的将其恢复。\r\n\r\n- JUnit 的完美支持\r\n\r\n- 对重构的优越支持：IDEA 是所有 IDE 中最早支持重构的，其优秀的重构能力一直是其主要卖点之一。\r\n\r\n- 编码辅助：Java 规范中提倡的 toString()、hashCode()、equals() 以及所有的 get/set 方法，你可以不用进行任何的输入就可以实现代码的自动生成，从而把你从无聊的基本方法编码中解放出来。\r\n\r\n- 灵活的排版功能：基本所有的 IDE 都有重排版功能，但仅有 IDEA 的是人性的，因为它支持排版模式的定制，你可以根据不同的项目要求采用不同的排版方式。\r\n\r\n- XML 的完美支持：XML 全提示支持：所有流行框架的 XML 文件都支持全提示，谁用谁知道。\r\n\r\n- 动态语法检测：任何不符合 Java 规范、自己预定义的规范、累赘都将在页面中加亮显示。\r\n\r\n- 代码检查：对代码进行自动分析，检测不符合规范的，存在风险的代码，并加亮显示。\r\n\r\n- 对 JSP 的完全支持：不需要任何的插件，完全支持 JSP。\r\n\r\n- 智能编辑：代码输入过程中，自动补充方法或类。\r\n\r\n- EJB 支持：不需要任何插件完全支持 EJB(6.0 支持 EJB 3.0)\r\n\r\n- 列编辑模式：用过 UtralEdit 的肯定对其的列编辑模式赞赏不已，因为它减少了很多无聊的重复工作，而 IDEA 完全支持该模式，从而更加提高了编码效率。\r\n\r\n- 预置模板：预置模板可以让你把经常用到的方法编辑进模板，使用时你只用输入简单的几个字母就可以完成全部代码的编写。例如使用比较高的 public static void main(String[] args){} 你可以在模板中预设 pm 为该方法，输入时你只要输入 pm 再按代码辅助键，IDEA 将完成代码的自动输入。\r\n\r\n- 完美的自动代码完成：智能检查类中的方法，当发现方法名只有一个时自动完成代码输入，从而减少剩下代码的编写工作。\r\n\r\n- 版本控制完美支持：集成了目前市面上常见的所有版本控制工具插件，包括 git、svn、github，让开发人员在编程的工程中直接在 Intellij IDEA 里就能完成代码的提交、检出、解决冲突、查看版本控制服务器内容等等。\r\n\r\n- 不使用代码的检查：自动检查代码中不使用的代码，并给出提示，从而使代码更高效。\r\n\r\n- 智能代码：自动检查代码，发现与预置规范有出入的代码给出提示，若程序员同意修改自动完成修改。例如代码：String str = \"Hello Intellij \" + \"IDEA\"; IDEA 将给出优化提示，若程序员同意修改 IDEA 将自动将代码修改为：String str = \"Hello Intellij IDEA\";\r\n\r\n- 正则表达式的查找和替换功能：查找和替换支持正则表达式，从而提高效率。\r\n\r\n- JavaDoc 预览支持：支持 JavaDoc 的预览功能，在 JavaDoc 代码中 Ctrl + Q 显示 JavaDoc 的结果，从而提高 DOC 文档的质量。\r\n\r\n- 程序员意图支持：程序员编码时 IDEA 时时检测你的意图，或提供建议，或直接帮你完成代码。','<h2 id=\"h2--idea\"><a name=\"什么是 IDEA\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>什么是 IDEA</h2><p><img src=\"http://localhost:8080/static/upload/716ec08c-d2f7-4c89-b2df-5749dc51a6b4.jpg\" alt=\"\"></p>\r\n<p>IDEA 全称 Intellij IDEA，是 Java 语言开发的集成环境，Intellij 在业界被公认为最好的 Java 开发工具之一，尤其是在智能代码助手、代码自动提示、重构、J2EE 支持、各类版本工具(git、svn、github 等)、JUnit、CVS 整合、代码分析、 创新的 GUI 设计等方面的功能可以说是超常的。IDEA 是 JetBrains 公司的产品，这家公司总部位于捷克共和国的首都布拉格，开发人员以严谨著称的东欧程序员为主。它的旗舰版本还支持 HTML，CSS，PHP，MySQL，Python 等。免费版只支持 Java 等少数语言。</p>\r\n<h2 id=\"h2-u7279u8272u529Fu80FD\"><a name=\"特色功能\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>特色功能</h2><ul>\r\n<li><p>智能的选取：在很多时候我们要选取某个方法，或某个循环或想一步一步从一个变量到整个类慢慢扩充着选取，IDEA就提供这种基于语法的选择，在默认设置中 Ctrl + W，可以实现选取范围的不断扩充，这种方式在重构的时候尤其显得方便。</p>\r\n</li><li><p>丰富的导航模式：IDEA 提供了丰富的导航查看模式，例如 Ctrl + E 显示最近打开过的文件，Ctrl + N 显示你希望显示的类名查找框（该框同样有智能补充功能，当你输入字母后IDEA将显示所有候选类名）。在最基本的 Project 视图中，你还可以选择多种的视图方式。</p>\r\n</li><li><p>历史记录功能：不用通过版本管理服务器，单纯的 IDEA 就可以查看任何工程中文件的历史记录，在版本恢复时你可以很容易的将其恢复。</p>\r\n</li><li><p>JUnit 的完美支持</p>\r\n</li><li><p>对重构的优越支持：IDEA 是所有 IDE 中最早支持重构的，其优秀的重构能力一直是其主要卖点之一。</p>\r\n</li><li><p>编码辅助：Java 规范中提倡的 toString()、hashCode()、equals() 以及所有的 get/set 方法，你可以不用进行任何的输入就可以实现代码的自动生成，从而把你从无聊的基本方法编码中解放出来。</p>\r\n</li><li><p>灵活的排版功能：基本所有的 IDE 都有重排版功能，但仅有 IDEA 的是人性的，因为它支持排版模式的定制，你可以根据不同的项目要求采用不同的排版方式。</p>\r\n</li><li><p>XML 的完美支持：XML 全提示支持：所有流行框架的 XML 文件都支持全提示，谁用谁知道。</p>\r\n</li><li><p>动态语法检测：任何不符合 Java 规范、自己预定义的规范、累赘都将在页面中加亮显示。</p>\r\n</li><li><p>代码检查：对代码进行自动分析，检测不符合规范的，存在风险的代码，并加亮显示。</p>\r\n</li><li><p>对 JSP 的完全支持：不需要任何的插件，完全支持 JSP。</p>\r\n</li><li><p>智能编辑：代码输入过程中，自动补充方法或类。</p>\r\n</li><li><p>EJB 支持：不需要任何插件完全支持 EJB(6.0 支持 EJB 3.0)</p>\r\n</li><li><p>列编辑模式：用过 UtralEdit 的肯定对其的列编辑模式赞赏不已，因为它减少了很多无聊的重复工作，而 IDEA 完全支持该模式，从而更加提高了编码效率。</p>\r\n</li><li><p>预置模板：预置模板可以让你把经常用到的方法编辑进模板，使用时你只用输入简单的几个字母就可以完成全部代码的编写。例如使用比较高的 public static void main(String[] args){} 你可以在模板中预设 pm 为该方法，输入时你只要输入 pm 再按代码辅助键，IDEA 将完成代码的自动输入。</p>\r\n</li><li><p>完美的自动代码完成：智能检查类中的方法，当发现方法名只有一个时自动完成代码输入，从而减少剩下代码的编写工作。</p>\r\n</li><li><p>版本控制完美支持：集成了目前市面上常见的所有版本控制工具插件，包括 git、svn、github，让开发人员在编程的工程中直接在 Intellij IDEA 里就能完成代码的提交、检出、解决冲突、查看版本控制服务器内容等等。</p>\r\n</li><li><p>不使用代码的检查：自动检查代码中不使用的代码，并给出提示，从而使代码更高效。</p>\r\n</li><li><p>智能代码：自动检查代码，发现与预置规范有出入的代码给出提示，若程序员同意修改自动完成修改。例如代码：String str = “Hello Intellij “ + “IDEA”; IDEA 将给出优化提示，若程序员同意修改 IDEA 将自动将代码修改为：String str = “Hello Intellij IDEA”;</p>\r\n</li><li><p>正则表达式的查找和替换功能：查找和替换支持正则表达式，从而提高效率。</p>\r\n</li><li><p>JavaDoc 预览支持：支持 JavaDoc 的预览功能，在 JavaDoc 代码中 Ctrl + Q 显示 JavaDoc 的结果，从而提高 DOC 文档的质量。</p>\r\n</li><li><p>程序员意图支持：程序员编码时 IDEA 时时检测你的意图，或提供建议，或直接帮你完成代码。</p>\r\n</li></ul>\r\n',3,0,1,1,1,'2019-01-13 20:53:37','2019-01-13 20:53:37'),
(92,1,'第一个 IDEA 应用程序','## 新建 Java Web 项目\r\n\r\n打开 IDEA -> Create New Project\r\n\r\n![](http://localhost:8080/static/upload/09cc3ab9-fc6a-482a-acf6-c2ed834029e3.png)\r\n\r\n选则 Java -> Java EE -> Web Applcation \r\n\r\n![](http://localhost:8080/static/upload/eef8d6b0-c06a-46d2-90e1-ed8073bbd801.png)\r\n\r\n\r\n## 选择工作空间\r\n\r\n项目命名后选择存放的工作空间，项目就创建完成了\r\n\r\n![](http://localhost:8080/static/upload/ec237939-c17d-4ca3-8fbe-ba620d650847.png)\r\n\r\n## 配置 JDK \r\n\r\n选择 File -> Project Structure...\r\n\r\n![](http://localhost:8080/static/upload/7c6fffbd-6679-4bc0-8bd6-e16777aa2950.png)\r\n\r\n选择 JDK 的安装路径即可\r\n\r\n![](http://localhost:8080/static/upload/23ea8b4d-eb92-4933-ac3a-29915d34495c.png)\r\n\r\n## 配置 Tomcat\r\n\r\n选择 Run -> Edit Configuratiosn...\r\n\r\n![](http://localhost:8080/static/upload/de4a9f07-e771-4e5e-9705-3dbcf46185ca.png)\r\n\r\n选择 + 号 -> Tomcat Server -> Local\r\n\r\n![](http://localhost:8080/static/upload/9333ec3d-56a9-4650-95ad-d5a6bed81f28.png)\r\n\r\n选择 Tomcat 的安装路径即可\r\n\r\n![](http://localhost:8080/static/upload/e30d6f81-cf51-4e4e-9a70-75d0715fe88c.png)\r\n\r\n## 配置 Tomcat 本地部署\r\n\r\n继续上一步，选择 Deploymet -> + 号 -> Artifact...\r\n![](http://localhost:8080/static/upload/bbc7ce5f-6138-4fba-8d24-4e983459371c.png)\r\n\r\n![](http://localhost:8080/static/upload/c83c8edd-c389-4fd7-a573-579479122cb3.png)\r\n\r\n选择 Server 配置自动更新\r\n\r\n![](http://localhost:8080/static/upload/8098997c-ceaa-4127-9a9c-34bf667cf712.png)\r\n\r\n## 测试运行\r\n\r\n选择需要运行的项目，点击 运行 图标\r\n\r\n![](http://localhost:8080/static/upload/d231b935-ddf3-4f55-8b79-c74abe3a9c1d.png)\r\n\r\n浏览器打开：http://localhost:8080 显示如下\r\n\r\n> $END$','<h2 id=\"h2--java-web-\"><a name=\"新建 Java Web 项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>新建 Java Web 项目</h2><p>打开 IDEA -&gt; Create New Project</p>\r\n<p><img src=\"http://localhost:8080/static/upload/09cc3ab9-fc6a-482a-acf6-c2ed834029e3.png\" alt=\"\"></p>\r\n<p>选则 Java -&gt; Java EE -&gt; Web Applcation </p>\r\n<p><img src=\"http://localhost:8080/static/upload/eef8d6b0-c06a-46d2-90e1-ed8073bbd801.png\" alt=\"\"></p>\r\n<h2 id=\"h2-u9009u62E9u5DE5u4F5Cu7A7Au95F4\"><a name=\"选择工作空间\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>选择工作空间</h2><p>项目命名后选择存放的工作空间，项目就创建完成了</p>\r\n<p><img src=\"http://localhost:8080/static/upload/ec237939-c17d-4ca3-8fbe-ba620d650847.png\" alt=\"\"></p>\r\n<h2 id=\"h2--jdk\"><a name=\"配置 JDK\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>配置 JDK</h2><p>选择 File -&gt; Project Structure…</p>\r\n<p><img src=\"http://localhost:8080/static/upload/7c6fffbd-6679-4bc0-8bd6-e16777aa2950.png\" alt=\"\"></p>\r\n<p>选择 JDK 的安装路径即可</p>\r\n<p><img src=\"http://localhost:8080/static/upload/23ea8b4d-eb92-4933-ac3a-29915d34495c.png\" alt=\"\"></p>\r\n<h2 id=\"h2--tomcat\"><a name=\"配置 Tomcat\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>配置 Tomcat</h2><p>选择 Run -&gt; Edit Configuratiosn…</p>\r\n<p><img src=\"http://localhost:8080/static/upload/de4a9f07-e771-4e5e-9705-3dbcf46185ca.png\" alt=\"\"></p>\r\n<p>选择 + 号 -&gt; Tomcat Server -&gt; Local</p>\r\n<p><img src=\"http://localhost:8080/static/upload/9333ec3d-56a9-4650-95ad-d5a6bed81f28.png\" alt=\"\"></p>\r\n<p>选择 Tomcat 的安装路径即可</p>\r\n<p><img src=\"http://localhost:8080/static/upload/e30d6f81-cf51-4e4e-9a70-75d0715fe88c.png\" alt=\"\"></p>\r\n<h2 id=\"h2--tomcat-\"><a name=\"配置 Tomcat 本地部署\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>配置 Tomcat 本地部署</h2><p>继续上一步，选择 Deploymet -&gt; + 号 -&gt; Artifact…<br><img src=\"http://localhost:8080/static/upload/bbc7ce5f-6138-4fba-8d24-4e983459371c.png\" alt=\"\"></p>\r\n<p><img src=\"http://localhost:8080/static/upload/c83c8edd-c389-4fd7-a573-579479122cb3.png\" alt=\"\"></p>\r\n<p>选择 Server 配置自动更新</p>\r\n<p><img src=\"http://localhost:8080/static/upload/8098997c-ceaa-4127-9a9c-34bf667cf712.png\" alt=\"\"></p>\r\n<h2 id=\"h2-u6D4Bu8BD5u8FD0u884C\"><a name=\"测试运行\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>测试运行</h2><p>选择需要运行的项目，点击 运行 图标</p>\r\n<p><img src=\"http://localhost:8080/static/upload/d231b935-ddf3-4f55-8b79-c74abe3a9c1d.png\" alt=\"\"></p>\r\n<p>浏览器打开：<a href=\"http://localhost:8080\">http://localhost:8080</a> 显示如下</p>\r\n<blockquote>\r\n<p>$END$</p>\r\n</blockquote>\r\n',4,0,1,1,1,'2019-01-13 21:07:51','2019-01-13 21:07:51'),
(93,1,'Maven 的简介','## 概述\r\n\r\nMaven 是一个项目管理和综合工具。Maven 提供了开发人员构建一个完整的生命周期框架。开发团队可以自动完成项目的基础工具建设，Maven 使用标准的目录结构和默认构建生命周期。\r\n\r\n在多个开发团队环境时，Maven 可以设置按标准在非常短的时间里完成配置工作。由于大部分项目的设置都很简单，并且可重复使用，Maven 让开发人员的工作更轻松，同时创建报表，检查，构建和测试自动化设置。\r\n\r\nMaven 提供了开发人员的方式的方式来管理：\r\n\r\n- Builds （构建）\r\n- Documentation （文档生产）\r\n- Reporting （报告）\r\n- Dependencies （依赖）\r\n- SCMS \r\n- Releases （发布）\r\n- Distribution （分发)\r\n- malling list （邮件列表）\r\n\r\n概括地说，Maven 简化和标准化项目建设过程，处理编译，分配，文档，团队协作和其他任务的无缝连接。Maven 增加可重用性并负责建立相关的任务。','<h2 id=\"h2-u6982u8FF0\"><a name=\"概述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>概述</h2><p>Maven 是一个项目管理和综合工具。Maven 提供了开发人员构建一个完整的生命周期框架。开发团队可以自动完成项目的基础工具建设，Maven 使用标准的目录结构和默认构建生命周期。</p>\r\n<p>在多个开发团队环境时，Maven 可以设置按标准在非常短的时间里完成配置工作。由于大部分项目的设置都很简单，并且可重复使用，Maven 让开发人员的工作更轻松，同时创建报表，检查，构建和测试自动化设置。</p>\r\n<p>Maven 提供了开发人员的方式的方式来管理：</p>\r\n<ul>\r\n<li>Builds （构建）</li><li>Documentation （文档生产）</li><li>Reporting （报告）</li><li>Dependencies （依赖）</li><li>SCMS </li><li>Releases （发布）</li><li>Distribution （分发)</li><li>malling list （邮件列表）</li></ul>\r\n<p>概括地说，Maven 简化和标准化项目建设过程，处理编译，分配，文档，团队协作和其他任务的无缝连接。Maven 增加可重用性并负责建立相关的任务。</p>\r\n',1,0,1,1,1,'2019-01-13 21:16:39','2019-01-13 21:16:39'),
(94,1,'Maven 安装配置 ','## 概述\r\n\r\n想要安装 Apache Maven 在 Windows 系统上, 需要下载 Maven 的 zip 文件，并将其解压到你想安装的目录，并配置 Windows 环境变量。\r\n\r\n注意：请尽量使用 JDK 1.8 及以上版本\r\n\r\n## JDK 和 JAVA_HOME\r\n\r\n确保已安装 JDK，并设置 JAVA_HOME 环境变量到 Windows 环境变量。\r\n\r\n![](http://localhost:8080/static/upload/2dd82a82-03ca-45d5-8d56-3c3d1bab5812.png)\r\n\r\n## 下载 Apache Maven\r\n\r\n下载地址：http://maven.apache.org/download.cgi\r\n\r\n![](http://localhost:8080/static/upload/2698be65-7f16-4f1c-b934-f02122276c09.png)\r\n\r\n下载 Maven 的 zip 文件，例如： apache-maven-3.5.2-bin.zip，将它解压到你要安装 Maven 的文件夹。假设你解压缩到文件夹 – D:\\apache-maven-3.5.2\r\n\r\n![](http://localhost:8080/static/upload/83c0344d-5380-47e1-99ab-a65ce347743a.png)\r\n\r\n注意：在这一步，只是文件夹和文件，安装不是必需的。\r\n\r\n## 添加 MAVEN_HOME\r\n\r\n添加 MAVEN_HOME 环境变量到 Windows 环境变量，并将其指向你的 Maven 文件夹。\r\n\r\n![](http://localhost:8080/static/upload/2b14c773-4812-4247-bb8f-56283ae2d9e3.png)\r\n\r\n## 添加到环境变量 - PATH\r\n\r\n![](http://localhost:8080/static/upload/980abeef-5619-495f-95d2-d1f6e211fa9b.png)\r\n\r\n## 验证\r\n\r\n使用命令：mvn -version\r\n\r\n输出：\r\n>C:\\Users\\Lusifer>mvn -version\r\nApache Maven 3.5.2 (138edd61fd100ec658bfa2d307c43b76940a5d7d; 2017-10-18T15:58:13+08:00)\r\nMaven home: D:\\apache-maven-3.5.2\\bin\\..\r\nJava version: 1.8.0_152, vendor: Oracle Corporation\r\nJava home: C:\\Program Files\\Java\\jdk1.8.0_152\\jre\r\nDefault locale: zh_CN, platform encoding: GBK\r\nOS name: \"windows 10\", version: \"10.0\", arch: \"amd64\", family: \"windows\"\r\n','<h2 id=\"h2-u6982u8FF0\"><a name=\"概述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>概述</h2><p>想要安装 Apache Maven 在 Windows 系统上, 需要下载 Maven 的 zip 文件，并将其解压到你想安装的目录，并配置 Windows 环境变量。</p>\r\n<p>注意：请尽量使用 JDK 1.8 及以上版本</p>\r\n<h2 id=\"h2-jdk-java_home\"><a name=\"JDK 和 JAVA_HOME\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>JDK 和 JAVA_HOME</h2><p>确保已安装 JDK，并设置 JAVA_HOME 环境变量到 Windows 环境变量。</p>\r\n<p><img src=\"http://localhost:8080/static/upload/2dd82a82-03ca-45d5-8d56-3c3d1bab5812.png\" alt=\"\"></p>\r\n<h2 id=\"h2--apache-maven\"><a name=\"下载 Apache Maven\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>下载 Apache Maven</h2><p>下载地址：<a href=\"http://maven.apache.org/download.cgi\">http://maven.apache.org/download.cgi</a></p>\r\n<p><img src=\"http://localhost:8080/static/upload/2698be65-7f16-4f1c-b934-f02122276c09.png\" alt=\"\"></p>\r\n<p>下载 Maven 的 zip 文件，例如： apache-maven-3.5.2-bin.zip，将它解压到你要安装 Maven 的文件夹。假设你解压缩到文件夹 – D:\\apache-maven-3.5.2</p>\r\n<p><img src=\"http://localhost:8080/static/upload/83c0344d-5380-47e1-99ab-a65ce347743a.png\" alt=\"\"></p>\r\n<p>注意：在这一步，只是文件夹和文件，安装不是必需的。</p>\r\n<h2 id=\"h2--maven_home\"><a name=\"添加 MAVEN_HOME\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>添加 MAVEN_HOME</h2><p>添加 MAVEN_HOME 环境变量到 Windows 环境变量，并将其指向你的 Maven 文件夹。</p>\r\n<p><img src=\"http://localhost:8080/static/upload/2b14c773-4812-4247-bb8f-56283ae2d9e3.png\" alt=\"\"></p>\r\n<h2 id=\"h2--path\"><a name=\"添加到环境变量 - PATH\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>添加到环境变量 - PATH</h2><p><img src=\"http://localhost:8080/static/upload/980abeef-5619-495f-95d2-d1f6e211fa9b.png\" alt=\"\"></p>\r\n<h2 id=\"h2-u9A8Cu8BC1\"><a name=\"验证\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>验证</h2><p>使用命令：mvn -version</p>\r\n<p>输出：</p>\r\n<blockquote>\r\n<p>C:\\Users\\Lusifer&gt;mvn -version<br>Apache Maven 3.5.2 (138edd61fd100ec658bfa2d307c43b76940a5d7d; 2017-10-18T15&#58;58&#58;13+08:00)<br>Maven home: D:\\apache-maven-3.5.2\\bin..<br>Java version: 1.8.0_152, vendor: Oracle Corporation<br>Java home: C:\\Program Files\\Java\\jdk1.8.0_152\\jre<br>Default locale: zh_CN, platform encoding: GBK<br>OS name: “windows 10”, version: “10.0”, arch: “amd64”, family: “windows”</p>\r\n</blockquote>\r\n',1,0,1,1,1,'2019-01-13 21:26:53','2019-01-13 21:26:53'),
(95,1,'Maven 本地仓库','## 概述\r\n\r\nMaven 的本地资源库是用来存储所有项目的依赖关系(插件 Jar 和其他文件，这些文件被 Maven 下载)到本地文件夹。很简单，当你建立一个 Maven 项目，所有相关文件将被存储在你的 Maven 本地仓库。\r\n\r\n默认情况下，Maven 的本地资源库默认为 .m2 目录文件夹：\r\n\r\n- Unix/Mac OS X：~/.m2\r\n- Windows：C:\\Documents and Settings\\{your-username}\\.m2\r\n\r\n通常情况下，可改变默认的 .m2 目录下的默认本地存储库文件夹到其他更有意义的名称，例如， maven-repo 找到 {M2_HOME}\\conf\\setting.xml, 更新 localRepository 到其它名称。\r\n\r\n![](http://localhost:8080/static/upload/f71f8de1-9484-4f9d-992c-7d0c2041df71.png)\r\n\r\n执行之后，新的 Maven 本地存储库现在改为 D:/apache-maven-3.5.2/repo\r\n\r\n![](http://localhost:8080/static/upload/39738c55-cd47-4844-a7f4-75d428fad391.png)\r\n\r\n','<h2 id=\"h2-u6982u8FF0\"><a name=\"概述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>概述</h2><p>Maven 的本地资源库是用来存储所有项目的依赖关系(插件 Jar 和其他文件，这些文件被 Maven 下载)到本地文件夹。很简单，当你建立一个 Maven 项目，所有相关文件将被存储在你的 Maven 本地仓库。</p>\r\n<p>默认情况下，Maven 的本地资源库默认为 .m2 目录文件夹：</p>\r\n<ul>\r\n<li>Unix/Mac OS X：~/.m2</li><li>Windows：C:\\Documents and Settings{your-username}.m2</li></ul>\r\n<p>通常情况下，可改变默认的 .m2 目录下的默认本地存储库文件夹到其他更有意义的名称，例如， maven-repo 找到 {M2_HOME}\\conf\\setting.xml, 更新 localRepository 到其它名称。</p>\r\n<p><img src=\"http://localhost:8080/static/upload/f71f8de1-9484-4f9d-992c-7d0c2041df71.png\" alt=\"\"></p>\r\n<p>执行之后，新的 Maven 本地存储库现在改为 D:/apache-maven-3.5.2/repo</p>\r\n<p><img src=\"http://localhost:8080/static/upload/39738c55-cd47-4844-a7f4-75d428fad391.png\" alt=\"\"></p>\r\n',0,0,0,1,1,'2019-01-13 21:30:16','2019-01-13 21:30:16'),
(96,1,'Maven 中央仓库 ','## 概述\r\n\r\n当你建立一个 Maven 的项目，Maven 会检查你的 pom.xml 文件，以确定哪些依赖下载。首先，Maven 将从本地资源库获得 Maven 的本地资源库依赖资源，如果没有找到，然后把它会从默认的 Maven 中央存储库 http://repo1.maven.org/maven2/ 查找下载。\r\n\r\n![](http://localhost:8080/static/upload/e4974642-62da-4041-98cb-d10de03faf44.png)\r\n\r\n使用 MVNrepository 搜索：https://mvnrepository.com/\r\n\r\n![](http://localhost:8080/static/upload/6946f27a-843b-4d3d-920d-c2b32b60d075.png)','<h2 id=\"h2-u6982u8FF0\"><a name=\"概述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>概述</h2><p>当你建立一个 Maven 的项目，Maven 会检查你的 pom.xml 文件，以确定哪些依赖下载。首先，Maven 将从本地资源库获得 Maven 的本地资源库依赖资源，如果没有找到，然后把它会从默认的 Maven 中央存储库 <a href=\"http://repo1.maven.org/maven2/\">http://repo1.maven.org/maven2/</a> 查找下载。</p>\r\n<p><img src=\"http://localhost:8080/static/upload/e4974642-62da-4041-98cb-d10de03faf44.png\" alt=\"\"></p>\r\n<p>使用 MVNrepository 搜索：<a href=\"https://mvnrepository.com/\">https://mvnrepository.com/</a></p>\r\n<p><img src=\"http://localhost:8080/static/upload/6946f27a-843b-4d3d-920d-c2b32b60d075.png\" alt=\"\"></p>\r\n',1,0,1,1,1,'2019-01-13 21:31:55','2019-01-13 21:31:55'),
(97,1,'Maven 依赖机制','## 概述\r\n\r\n在 Maven 依赖机制的帮助下自动下载所有必需的依赖库，并保持版本升级。让我们看一个案例研究，以了解它是如何工作的。假设你想使用 Log4j 作为项目的日志。这里你要做什么？\r\n\r\n## 传统方式\r\n\r\n- 访问 http://logging.apache.org/log4j/\r\n- 下载 Log4j 的 jar 库\r\n- 复制 jar 到项目类路径\r\n- 手动将其包含到项目的依赖\r\n- 所有的管理需要一切由自己做\r\n\r\n如果有 Log4j 版本升级，则需要重复上述步骤一次。\r\n\r\n## Maven 的方式\r\n\r\n- 你需要知道 log4j 的 Maven 坐标，例如：\r\n\r\n        <groupId>log4j</groupId>\r\n        <artifactId>log4j</artifactId>\r\n        <version>1.2.17</version>\r\n\r\n- 它会自动下载 log4j 的 1.2.17 版本库\r\n\r\n- 声明 Maven 的坐标转换成 pom.xml 文件\r\n\r\n        <dependencies>\r\n          <dependency>\r\n            <groupId>log4j</groupId>\r\n            <artifactId>log4j</artifactId>\r\n            <version>1.2.17</version>\r\n          </dependency>\r\n        </dependencies>\r\n\r\n- 当 Maven 编译或构建，log4j 的 jar 会自动下载，并把它放到 Maven 本地存储库\r\n\r\n- 所有由 Maven 管理\r\n\r\n## 解释说明\r\n\r\n看看有什么不同？那么到底在 Maven 发生了什么？当建立一个 Maven 的项目，pom.xml 文件将被解析，如果看到 log4j 的 Maven 坐标，然后 Maven 按此顺序搜索 log4j 库：\r\n\r\n- 在 Maven 的本地仓库搜索 log4j\r\n- 在 Maven 中央存储库搜索 log4j\r\n- 在 Maven 远程仓库搜索 log4j(如果在 pom.xml 中定义)\r\n\r\nMaven 依赖库管理是一个非常好的工具，为您节省了大量的工作\r\n','<h2 id=\"h2-u6982u8FF0\"><a name=\"概述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>概述</h2><p>在 Maven 依赖机制的帮助下自动下载所有必需的依赖库，并保持版本升级。让我们看一个案例研究，以了解它是如何工作的。假设你想使用 Log4j 作为项目的日志。这里你要做什么？</p>\r\n<h2 id=\"h2-u4F20u7EDFu65B9u5F0F\"><a name=\"传统方式\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>传统方式</h2><ul>\r\n<li>访问 <a href=\"http://logging.apache.org/log4j/\">http://logging.apache.org/log4j/</a></li><li>下载 Log4j 的 jar 库</li><li>复制 jar 到项目类路径</li><li>手动将其包含到项目的依赖</li><li>所有的管理需要一切由自己做</li></ul>\r\n<p>如果有 Log4j 版本升级，则需要重复上述步骤一次。</p>\r\n<h2 id=\"h2-maven-\"><a name=\"Maven 的方式\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Maven 的方式</h2><ul>\r\n<li><p>你需要知道 log4j 的 Maven 坐标，例如：</p>\r\n<pre><code>  &lt;groupId&gt;log4j&lt;/groupId&gt;\r\n  &lt;artifactId&gt;log4j&lt;/artifactId&gt;\r\n  &lt;version&gt;1.2.17&lt;/version&gt;\r\n</code></pre></li><li><p>它会自动下载 log4j 的 1.2.17 版本库</p>\r\n</li><li><p>声明 Maven 的坐标转换成 pom.xml 文件</p>\r\n<pre><code>  &lt;dependencies&gt;\r\n    &lt;dependency&gt;\r\n      &lt;groupId&gt;log4j&lt;/groupId&gt;\r\n      &lt;artifactId&gt;log4j&lt;/artifactId&gt;\r\n      &lt;version&gt;1.2.17&lt;/version&gt;\r\n    &lt;/dependency&gt;\r\n  &lt;/dependencies&gt;\r\n</code></pre></li><li><p>当 Maven 编译或构建，log4j 的 jar 会自动下载，并把它放到 Maven 本地存储库</p>\r\n</li><li><p>所有由 Maven 管理</p>\r\n</li></ul>\r\n<h2 id=\"h2-u89E3u91CAu8BF4u660E\"><a name=\"解释说明\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>解释说明</h2><p>看看有什么不同？那么到底在 Maven 发生了什么？当建立一个 Maven 的项目，pom.xml 文件将被解析，如果看到 log4j 的 Maven 坐标，然后 Maven 按此顺序搜索 log4j 库：</p>\r\n<ul>\r\n<li>在 Maven 的本地仓库搜索 log4j</li><li>在 Maven 中央存储库搜索 log4j</li><li>在 Maven 远程仓库搜索 log4j(如果在 pom.xml 中定义)</li></ul>\r\n<p>Maven 依赖库管理是一个非常好的工具，为您节省了大量的工作</p>\r\n',2,0,0,1,1,'2019-01-13 21:35:44','2019-01-13 21:35:44'),
(98,1,'Maven POM','## 概述\r\n\r\nPOM 代表项目对象模型。它是 Maven 中工作的基本单位，这是一个 XML 文件。它始终保存在该项目基本目录中的 pom.xml 文件。\r\n\r\nPOM 包含的项目是使用 Maven 来构建的，它用来包含各种配置信息。\r\n\r\nPOM 也包含了目标和插件。在执行任务或目标时，Maven 会使用当前目录中的 POM。它读取POM得到所需要的配置信息，然后执行目标。部分的配置可以在 POM 使用如下：\r\n\r\n- project dependencies\r\n- plugins\r\n- golas\r\n- build profiles\r\n- project version\r\n- developers\r\n- mailing list\r\n\r\n创建一个POM之前，应该要先决定项目组(groupId)，它的名字(artifactId)和版本，因为这些属性在项目仓库是唯一标识的。\r\n\r\n## POM 的例子\r\n\r\n    <project xmlns=\"http://maven.apache.org/POM/4.0.0\"\r\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n       xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0\r\n       http://maven.apache.org/xsd/maven-4.0.0.xsd\">\r\n       <modelVersion>4.0.0</modelVersion>\r\n       <groupId>com.lusifer</groupId>\r\n       <artifactId>project</artifactId>\r\n       <version>1.0</version>\r\n    <project>\r\n\r\n要注意的是，每个项目只有一个 POM 文件\r\n\r\n- 所有的 POM 文件要项目元素必须有三个必填字段: groupId，artifactId，version\r\n- 在库中的项目符号是：groupId:artifactId:version\r\n- pom.xml 的根元素是 project，它有三个主要的子节点。\r\n\r\n| 节点     | 描述                                                                                                                                                          |\r\n| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |\r\n| groupId    | 这是项目组的编号，这在组织或项目中通常是独一无二的。 例如，一家银行集团 com.company.bank 拥有所有银行相关项目。   |\r\n| artifactId | 这是项目的 ID。这通常是项目的名称。 例如，consumer-banking。 除了 groupId 之外，artifactId 还定义了 artifact 在存储库中的位置。 |\r\n| version    | 这是项目的版本。与 groupId 一起使用，artifact 在存储库中用于将版本彼此分离。 例如：com.company.bank:consumer-banking:1.0，com.company.bank:consumer-banking:1.1 |','<h2 id=\"h2-u6982u8FF0\"><a name=\"概述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>概述</h2><p>POM 代表项目对象模型。它是 Maven 中工作的基本单位，这是一个 XML 文件。它始终保存在该项目基本目录中的 pom.xml 文件。</p>\r\n<p>POM 包含的项目是使用 Maven 来构建的，它用来包含各种配置信息。</p>\r\n<p>POM 也包含了目标和插件。在执行任务或目标时，Maven 会使用当前目录中的 POM。它读取POM得到所需要的配置信息，然后执行目标。部分的配置可以在 POM 使用如下：</p>\r\n<ul>\r\n<li>project dependencies</li><li>plugins</li><li>golas</li><li>build profiles</li><li>project version</li><li>developers</li><li>mailing list</li></ul>\r\n<p>创建一个POM之前，应该要先决定项目组(groupId)，它的名字(artifactId)和版本，因为这些属性在项目仓库是唯一标识的。</p>\r\n<h2 id=\"h2-pom-\"><a name=\"POM 的例子\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>POM 的例子</h2><pre><code>&lt;project xmlns=&quot;http://maven.apache.org/POM/4.0.0&quot;\r\n   xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;\r\n   xsi:schemaLocation=&quot;http://maven.apache.org/POM/4.0.0\r\n   http://maven.apache.org/xsd/maven-4.0.0.xsd&quot;&gt;\r\n   &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;\r\n   &lt;groupId&gt;com.lusifer&lt;/groupId&gt;\r\n   &lt;artifactId&gt;project&lt;/artifactId&gt;\r\n   &lt;version&gt;1.0&lt;/version&gt;\r\n&lt;project&gt;\r\n</code></pre><p>要注意的是，每个项目只有一个 POM 文件</p>\r\n<ul>\r\n<li>所有的 POM 文件要项目元素必须有三个必填字段: groupId，artifactId，version</li><li>在库中的项目符号是：groupId:artifactId:version</li><li>pom.xml 的根元素是 project，它有三个主要的子节点。</li></ul>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>节点</th>\r\n<th>描述</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>groupId</td>\r\n<td>这是项目组的编号，这在组织或项目中通常是独一无二的。 例如，一家银行集团 com.company.bank 拥有所有银行相关项目。</td>\r\n</tr>\r\n<tr>\r\n<td>artifactId</td>\r\n<td>这是项目的 ID。这通常是项目的名称。 例如，consumer-banking。 除了 groupId 之外，artifactId 还定义了 artifact 在存储库中的位置。</td>\r\n</tr>\r\n<tr>\r\n<td>version</td>\r\n<td>这是项目的版本。与 groupId 一起使用，artifact 在存储库中用于将版本彼此分离。 例如：com.company.bank:consumer-banking:1.0，com.company.bank:consumer-banking:1.1</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n',1,0,0,1,1,'2019-01-13 21:40:55','2019-01-13 21:40:55'),
(99,1,'Maven 插件','Maven 是一个执行插件的框架，每一个任务实际上是由插件完成的。Maven 插件通常用于：\r\n\r\n- 创建 jar 文件\r\n- 创建 war 文件\r\n- 编译代码文件\r\n- 进行代码单元测试\r\n- 创建项目文档\r\n- 创建项目报告 一个插件通常提供了一组目标，可使用以下语法来执行：\r\n\r\n    mvn [plugin-name]:[goal-name]\r\n\r\n例如，一个 Java 项目可以使用 Maven 编译器插件来编译目标，通过运行以下命令编译\r\n\r\n    mvn compiler:compile\r\n\r\n## 插件类型\r\n\r\nMaven 提供以下两种类型插件：\r\n\r\n| 类型   | 描述                                           |\r\n| -------- | ------------------------------------------------ |\r\n| 构建插件 | 在生成过程中执行，并在 pom.xml 中的 元素进行配置 |\r\n| 报告插件 | 在网站生成期间执行，在 pom.xml 中的,元素进行配置 |\r\n\r\n以下是一些常见的插件列表：\r\n\r\n| 插件   | 描述                                |\r\n| -------- | ------------------------------------- |\r\n| clean    | 编译后的清理目标，删除目标目录 |\r\n| compiler | 编译 Java 源文件                 |\r\n| surefile | 运行JUnit单元测试，创建测试报告 |\r\n| jar      | 从当前项目构建 JAR 文件      |\r\n| war      | 从当前项目构建 WAR 文件      |\r\n| javadoc  | 产生用于该项目的 Javadoc      |\r\n| antrun   | 从构建所述的任何阶段运行一组 Ant 任务 |\r\n','<p>Maven 是一个执行插件的框架，每一个任务实际上是由插件完成的。Maven 插件通常用于：</p>\r\n<ul>\r\n<li>创建 jar 文件</li><li>创建 war 文件</li><li>编译代码文件</li><li>进行代码单元测试</li><li>创建项目文档</li><li><p>创建项目报告 一个插件通常提供了一组目标，可使用以下语法来执行：</p>\r\n<p>  mvn [plugin-name]:[goal-name]</p>\r\n</li></ul>\r\n<p>例如，一个 Java 项目可以使用 Maven 编译器插件来编译目标，通过运行以下命令编译</p>\r\n<pre><code>mvn compiler:compile\r\n</code></pre><h2 id=\"h2-u63D2u4EF6u7C7Bu578B\"><a name=\"插件类型\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>插件类型</h2><p>Maven 提供以下两种类型插件：</p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>类型</th>\r\n<th>描述</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>构建插件</td>\r\n<td>在生成过程中执行，并在 pom.xml 中的 元素进行配置</td>\r\n</tr>\r\n<tr>\r\n<td>报告插件</td>\r\n<td>在网站生成期间执行，在 pom.xml 中的,元素进行配置</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>以下是一些常见的插件列表：</p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>插件</th>\r\n<th>描述</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>clean</td>\r\n<td>编译后的清理目标，删除目标目录</td>\r\n</tr>\r\n<tr>\r\n<td>compiler</td>\r\n<td>编译 Java 源文件</td>\r\n</tr>\r\n<tr>\r\n<td>surefile</td>\r\n<td>运行JUnit单元测试，创建测试报告</td>\r\n</tr>\r\n<tr>\r\n<td>jar</td>\r\n<td>从当前项目构建 JAR 文件</td>\r\n</tr>\r\n<tr>\r\n<td>war</td>\r\n<td>从当前项目构建 WAR 文件</td>\r\n</tr>\r\n<tr>\r\n<td>javadoc</td>\r\n<td>产生用于该项目的 Javadoc</td>\r\n</tr>\r\n<tr>\r\n<td>antrun</td>\r\n<td>从构建所述的任何阶段运行一组 Ant 任务</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n',0,0,0,1,1,'2019-01-13 21:46:35','2019-01-13 21:46:35'),
(100,1,'Maven 快照','## 概述\r\n\r\n大型应用软件一般由多个模块组成，一般它是多个团队开发同一个应用程序的不同模块，这是比较常见的场景。例如，一个团队正在对应用程序的应用程序，用户界面项目(app-ui.jar:1.0) 的前端进行开发，他们使用的是数据服务工程 (data-service.jar:1.0)。\r\n\r\n现在，它可能会有这样的情况发生，工作在数据服务团队开发人员快速地开发 bug 修复或增强功能，他们几乎每隔一天就要释放出库到远程仓库。\r\n\r\n现在，如果数据服务团队上传新版本后，会出现下面的问题：\r\n\r\n- 数据服务团队应该发布更新时每次都告诉应用程序 UI 团队，他们已经发布更新了代码。\r\n\r\n- UI 团队需要经常更新自己 pom.xml 以获得更新应用程序的版本。\r\n\r\n为了处理这类情况，引入快照的概念，并发挥作用。\r\n\r\n## 什么是快照？\r\n\r\n快照（SNAPSHOT）是一个特殊版本，指出目前开发拷贝。不同于常规版本，Maven 每生成一个远程存储库都会检查新的快照版本。\r\n\r\n现在，数据服务团队将在每次发布代码后更新快照存储库为：data-service:1.0-SNAPSHOT 替换旧的 SNAPSHOT jar。\r\n\r\n## 快照与版本\r\n\r\n在使用版本时，如果 Maven 下载所提到的版本为 data-service:1.0，那么它永远不会尝试在库中下载已经更新的版本 1.0。要下载更新的代码，data-service 的版本必须要升级到 1.1。\r\n\r\n在使用快照（SNAPSHOT）时，Maven 会在每次应用程序 UI 团队建立自己的项目时自动获取最新的快照（data-service:1.0-SNAPSHOT）。','<h2 id=\"h2-u6982u8FF0\"><a name=\"概述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>概述</h2><p>大型应用软件一般由多个模块组成，一般它是多个团队开发同一个应用程序的不同模块，这是比较常见的场景。例如，一个团队正在对应用程序的应用程序，用户界面项目(app-ui.jar:1.0) 的前端进行开发，他们使用的是数据服务工程 (data-service.jar:1.0)。</p>\r\n<p>现在，它可能会有这样的情况发生，工作在数据服务团队开发人员快速地开发 bug 修复或增强功能，他们几乎每隔一天就要释放出库到远程仓库。</p>\r\n<p>现在，如果数据服务团队上传新版本后，会出现下面的问题：</p>\r\n<ul>\r\n<li><p>数据服务团队应该发布更新时每次都告诉应用程序 UI 团队，他们已经发布更新了代码。</p>\r\n</li><li><p>UI 团队需要经常更新自己 pom.xml 以获得更新应用程序的版本。</p>\r\n</li></ul>\r\n<p>为了处理这类情况，引入快照的概念，并发挥作用。</p>\r\n<h2 id=\"h2--\"><a name=\"什么是快照？\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>什么是快照？</h2><p>快照（SNAPSHOT）是一个特殊版本，指出目前开发拷贝。不同于常规版本，Maven 每生成一个远程存储库都会检查新的快照版本。</p>\r\n<p>现在，数据服务团队将在每次发布代码后更新快照存储库为：data-service:1.0-SNAPSHOT 替换旧的 SNAPSHOT jar。</p>\r\n<h2 id=\"h2-u5FEBu7167u4E0Eu7248u672C\"><a name=\"快照与版本\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>快照与版本</h2><p>在使用版本时，如果 Maven 下载所提到的版本为 data-service:1.0，那么它永远不会尝试在库中下载已经更新的版本 1.0。要下载更新的代码，data-service 的版本必须要升级到 1.1。</p>\r\n<p>在使用快照（SNAPSHOT）时，Maven 会在每次应用程序 UI 团队建立自己的项目时自动获取最新的快照（data-service:1.0-SNAPSHOT）。</p>\r\n',0,0,0,1,1,'2019-01-13 21:48:22','2019-01-13 21:48:22'),
(101,1,'Maven 常用命令','## 清除产生的项目\r\n\r\n> mvn clean\r\n\r\n## 编译源代码\r\n\r\n> mvc compile\r\n\r\n## 打包\r\n\r\n> mvn package\r\n\r\n## 只打包不测试（跳过测试）\r\n\r\n> mvn -dmaven.test.skip=true\r\n\r\n## 安装到本地仓库\r\n\r\n> mvn install\r\n\r\n## 源码打包\r\n\r\n> mvn source:jar\r\n或\r\nmvn source:jar-no-fork\r\n','<h2 id=\"h2-u6E05u9664u4EA7u751Fu7684u9879u76EE\"><a name=\"清除产生的项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>清除产生的项目</h2><blockquote>\r\n<p>mvn clean</p>\r\n</blockquote>\r\n<h2 id=\"h2-u7F16u8BD1u6E90u4EE3u7801\"><a name=\"编译源代码\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>编译源代码</h2><blockquote>\r\n<p>mvc compile</p>\r\n</blockquote>\r\n<h2 id=\"h2-u6253u5305\"><a name=\"打包\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>打包</h2><blockquote>\r\n<p>mvn package</p>\r\n</blockquote>\r\n<h2 id=\"h2--\"><a name=\"只打包不测试（跳过测试）\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>只打包不测试（跳过测试）</h2><blockquote>\r\n<p>mvn -dmaven.test.skip=true</p>\r\n</blockquote>\r\n<h2 id=\"h2-u5B89u88C5u5230u672Cu5730u4ED3u5E93\"><a name=\"安装到本地仓库\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>安装到本地仓库</h2><blockquote>\r\n<p>mvn install</p>\r\n</blockquote>\r\n<h2 id=\"h2-u6E90u7801u6253u5305\"><a name=\"源码打包\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>源码打包</h2><blockquote>\r\n<p>mvn source:jar<br>或<br>mvn source:jar-no-fork</p>\r\n</blockquote>\r\n',1,0,1,1,1,'2019-01-13 21:50:06','2019-01-13 21:50:06'),
(102,1,'第一个 Maven 应用程序','## 创建 Maven 项目\r\n\r\n选择 File -> New -> Project...\r\n\r\n![](http://localhost:8080/static/upload/857b6c98-1303-4c49-b493-3e569b41783e.png)\r\n\r\n选择 Maven 项目\r\n\r\n![](http://localhost:8080/static/upload/048028f2-b4e9-4ba6-a42f-812b27e45c90.png)\r\n\r\n填写项目信息\r\n\r\n![](http://localhost:8080/static/upload/6ca71a41-f6b7-4abf-9d7d-229b32a61f3b.png)\r\n\r\n选择工作空间\r\n\r\n![](http://localhost:8080/static/upload/14ed8f8c-cb85-4363-92de-15111aa234ca.png)\r\n\r\n## 目录结构\r\n\r\nJava Web 的 Maven 基本结构如下：\r\n\r\n>├─src\r\n│  ├─main\r\n│  │  ├─java\r\n│  │  ├─resources\r\n│  │  └─webapp\r\n│  │      └─WEB-INF\r\n│  └─test\r\n│      └─java\r\n\r\n结构说明：\r\n\r\nsrc：源码目录\r\nsrc/main/java：Java 源码目录\r\nsrc/main/resources：资源文件目录\r\nsrc/main/webapp：Web 相关目录\r\nsrc/test：单元测试\r\n\r\n## IDEA Maven 项目管理\r\n\r\n在 IDEA 界面的右侧 Maven Projects 选项，可以管理 Maven 项目的整个生命周期、插件、依赖等\r\n\r\n![](http://localhost:8080/static/upload/ec4beb3b-53a8-485d-a3a1-765033e48914.png)\r\n\r\n## 完善 Java Web 程序\r\n\r\n### POM\r\n\r\n修改 pom.xml 配置，内容如下：\r\n\r\n    <?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n    <project xmlns=\"http://maven.apache.org/POM/4.0.0\"\r\n             xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">\r\n        <modelVersion>4.0.0</modelVersion>\r\n    \r\n        <groupId>com.funtl</groupId>\r\n        <artifactId>hello-maven</artifactId>\r\n        <version>1.0.0-SNAPSHOT</version>\r\n        <packaging>war</packaging>\r\n    \r\n        <dependencies>\r\n            <dependency>\r\n                <groupId>javax.servlet</groupId>\r\n                <artifactId>javax.servlet-api</artifactId>\r\n                <version>4.0.1</version>\r\n                <scope>provided</scope>\r\n            </dependency>\r\n    \r\n            <dependency>\r\n                <groupId>org.slf4j</groupId>\r\n                <artifactId>log4j-over-slf4j</artifactId>\r\n                <version>1.7.25</version>\r\n            </dependency>\r\n        </dependencies>\r\n    </project>\r\n\r\n\r\n配置说明：\r\n\r\n- packaging：打包方式，这里是 war 包，表示为 Java Web 应用程序\r\n\r\n- dependencies：项目依赖配置，整个项目生命周期中所需的依赖都在这里配置\r\n\r\n## 创建测试用 Servlet\r\n\r\n创建一个 Servlet 用于测试请求\r\n\r\n    package com.funtl.hello.maven.servlet;\r\n    \r\n    import javax.servlet.ServletException;\r\n    import javax.servlet.http.HttpServlet;\r\n    import javax.servlet.http.HttpServletRequest;\r\n    import javax.servlet.http.HttpServletResponse;\r\n    import java.io.IOException;\r\n    \r\n    public class HelloServlet extends HttpServlet {\r\n    \r\n        @Override\r\n        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {\r\n            req.getRequestDispatcher(\"/index.jsp\").forward(req, resp);\r\n        }\r\n    \r\n        @Override\r\n        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {\r\n            super.doPost(req, resp);\r\n        }\r\n    }\r\n\r\n\r\n## 创建测试用 JSP\r\n\r\n创建一个 JSP 页面，用于测试请求\r\n\r\n    <%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>\r\n    <html>\r\n    <head>\r\n        <title>Title</title>\r\n    </head>\r\n    <body>\r\n        Hello Maven\r\n    </body>\r\n    </html>\r\n\r\n\r\n## 创建 Log4J 的配置文件\r\n\r\n在 src/main/resources 目录下创建 log4j.properties 配置文件，内容如下：\r\n\r\n    log4j.rootLogger=INFO, console, file\r\n    \r\n    log4j.appender.console=org.apache.log4j.ConsoleAppender\r\n    log4j.appender.console.layout=org.apache.log4j.PatternLayout\r\n    log4j.appender.console.layout.ConversionPattern=%d %p [%c] - %m%n\r\n    \r\n    log4j.appender.file=org.apache.log4j.DailyRollingFileAppender\r\n    log4j.appender.file.File=logs/log.log\r\n    log4j.appender.file.layout=org.apache.log4j.PatternLayout\r\n    log4j.appender.A3.MaxFileSize=1024KB\r\n    log4j.appender.A3.MaxBackupIndex=10\r\n    log4j.appender.file.layout.ConversionPattern=%d %p [%c] - %m%n\r\n\r\n\r\n## 配置 web.xml\r\n\r\nweb.xml 配置文件如下：\r\n\r\n    <?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n    <web-app xmlns=\"http://xmlns.jcp.org/xml/ns/javaee\"\r\n             xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xsi:schemaLocation=\"http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd\"\r\n             version=\"4.0\">\r\n    \r\n        <servlet>\r\n            <servlet-name>HelloServlet</servlet-name>\r\n            <servlet-class>com.funtl.hello.maven.servlet.HelloServlet</servlet-class>\r\n        </servlet>\r\n        <servlet-mapping>\r\n            <servlet-name>HelloServlet</servlet-name>\r\n            <url-pattern>/servlet/hello</url-pattern>\r\n        </servlet-mapping>\r\n    </web-app>\r\n\r\n## 测试运行\r\n\r\n打开浏览器访问http://localhost:8080 显示如下：\r\n\r\n> Hello Maven','<h2 id=\"h2--maven-\"><a name=\"创建 Maven 项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>创建 Maven 项目</h2><p>选择 File -&gt; New -&gt; Project…</p>\r\n<p><img src=\"http://localhost:8080/static/upload/857b6c98-1303-4c49-b493-3e569b41783e.png\" alt=\"\"></p>\r\n<p>选择 Maven 项目</p>\r\n<p><img src=\"http://localhost:8080/static/upload/048028f2-b4e9-4ba6-a42f-812b27e45c90.png\" alt=\"\"></p>\r\n<p>填写项目信息</p>\r\n<p><img src=\"http://localhost:8080/static/upload/6ca71a41-f6b7-4abf-9d7d-229b32a61f3b.png\" alt=\"\"></p>\r\n<p>选择工作空间</p>\r\n<p><img src=\"http://localhost:8080/static/upload/14ed8f8c-cb85-4363-92de-15111aa234ca.png\" alt=\"\"></p>\r\n<h2 id=\"h2-u76EEu5F55u7ED3u6784\"><a name=\"目录结构\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>目录结构</h2><p>Java Web 的 Maven 基本结构如下：</p>\r\n<blockquote>\r\n<p>├─src<br>│  ├─main<br>│  │  ├─java<br>│  │  ├─resources<br>│  │  └─webapp<br>│  │      └─WEB-INF<br>│  └─test<br>│      └─java</p>\r\n</blockquote>\r\n<p>结构说明：</p>\r\n<p>src：源码目录<br>src/main/java：Java 源码目录<br>src/main/resources：资源文件目录<br>src/main/webapp：Web 相关目录<br>src/test：单元测试</p>\r\n<h2 id=\"h2-idea-maven-\"><a name=\"IDEA Maven 项目管理\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>IDEA Maven 项目管理</h2><p>在 IDEA 界面的右侧 Maven Projects 选项，可以管理 Maven 项目的整个生命周期、插件、依赖等</p>\r\n<p><img src=\"http://localhost:8080/static/upload/ec4beb3b-53a8-485d-a3a1-765033e48914.png\" alt=\"\"></p>\r\n<h2 id=\"h2--java-web-\"><a name=\"完善 Java Web 程序\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>完善 Java Web 程序</h2><h3 id=\"h3-pom\"><a name=\"POM\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>POM</h3><p>修改 pom.xml 配置，内容如下：</p>\r\n<pre><code>&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;\r\n&lt;project xmlns=&quot;http://maven.apache.org/POM/4.0.0&quot;\r\n         xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;\r\n         xsi:schemaLocation=&quot;http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd&quot;&gt;\r\n    &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;\r\n\r\n    &lt;groupId&gt;com.funtl&lt;/groupId&gt;\r\n    &lt;artifactId&gt;hello-maven&lt;/artifactId&gt;\r\n    &lt;version&gt;1.0.0-SNAPSHOT&lt;/version&gt;\r\n    &lt;packaging&gt;war&lt;/packaging&gt;\r\n\r\n    &lt;dependencies&gt;\r\n        &lt;dependency&gt;\r\n            &lt;groupId&gt;javax.servlet&lt;/groupId&gt;\r\n            &lt;artifactId&gt;javax.servlet-api&lt;/artifactId&gt;\r\n            &lt;version&gt;4.0.1&lt;/version&gt;\r\n            &lt;scope&gt;provided&lt;/scope&gt;\r\n        &lt;/dependency&gt;\r\n\r\n        &lt;dependency&gt;\r\n            &lt;groupId&gt;org.slf4j&lt;/groupId&gt;\r\n            &lt;artifactId&gt;log4j-over-slf4j&lt;/artifactId&gt;\r\n            &lt;version&gt;1.7.25&lt;/version&gt;\r\n        &lt;/dependency&gt;\r\n    &lt;/dependencies&gt;\r\n&lt;/project&gt;\r\n</code></pre><p>配置说明：</p>\r\n<ul>\r\n<li><p>packaging：打包方式，这里是 war 包，表示为 Java Web 应用程序</p>\r\n</li><li><p>dependencies：项目依赖配置，整个项目生命周期中所需的依赖都在这里配置</p>\r\n</li></ul>\r\n<h2 id=\"h2--servlet\"><a name=\"创建测试用 Servlet\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>创建测试用 Servlet</h2><p>创建一个 Servlet 用于测试请求</p>\r\n<pre><code>package com.funtl.hello.maven.servlet;\r\n\r\nimport javax.servlet.ServletException;\r\nimport javax.servlet.http.HttpServlet;\r\nimport javax.servlet.http.HttpServletRequest;\r\nimport javax.servlet.http.HttpServletResponse;\r\nimport java.io.IOException;\r\n\r\npublic class HelloServlet extends HttpServlet {\r\n\r\n    @Override\r\n    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {\r\n        req.getRequestDispatcher(&quot;/index.jsp&quot;).forward(req, resp);\r\n    }\r\n\r\n    @Override\r\n    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {\r\n        super.doPost(req, resp);\r\n    }\r\n}\r\n</code></pre><h2 id=\"h2--jsp\"><a name=\"创建测试用 JSP\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>创建测试用 JSP</h2><p>创建一个 JSP 页面，用于测试请求</p>\r\n<pre><code>&lt;%@ page contentType=&quot;text/html;charset=UTF-8&quot; language=&quot;java&quot; %&gt;\r\n&lt;html&gt;\r\n&lt;head&gt;\r\n    &lt;title&gt;Title&lt;/title&gt;\r\n&lt;/head&gt;\r\n&lt;body&gt;\r\n    Hello Maven\r\n&lt;/body&gt;\r\n&lt;/html&gt;\r\n</code></pre><h2 id=\"h2--log4j-\"><a name=\"创建 Log4J 的配置文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>创建 Log4J 的配置文件</h2><p>在 src/main/resources 目录下创建 log4j.properties 配置文件，内容如下：</p>\r\n<pre><code>log4j.rootLogger=INFO, console, file\r\n\r\nlog4j.appender.console=org.apache.log4j.ConsoleAppender\r\nlog4j.appender.console.layout=org.apache.log4j.PatternLayout\r\nlog4j.appender.console.layout.ConversionPattern=%d %p [%c] - %m%n\r\n\r\nlog4j.appender.file=org.apache.log4j.DailyRollingFileAppender\r\nlog4j.appender.file.File=logs/log.log\r\nlog4j.appender.file.layout=org.apache.log4j.PatternLayout\r\nlog4j.appender.A3.MaxFileSize=1024KB\r\nlog4j.appender.A3.MaxBackupIndex=10\r\nlog4j.appender.file.layout.ConversionPattern=%d %p [%c] - %m%n\r\n</code></pre><h2 id=\"h2--web-xml\"><a name=\"配置 web.xml\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>配置 web.xml</h2><p>web.xml 配置文件如下：</p>\r\n<pre><code>&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;\r\n&lt;web-app xmlns=&quot;http://xmlns.jcp.org/xml/ns/javaee&quot;\r\n         xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;\r\n         xsi:schemaLocation=&quot;http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd&quot;\r\n         version=&quot;4.0&quot;&gt;\r\n\r\n    &lt;servlet&gt;\r\n        &lt;servlet-name&gt;HelloServlet&lt;/servlet-name&gt;\r\n        &lt;servlet-class&gt;com.funtl.hello.maven.servlet.HelloServlet&lt;/servlet-class&gt;\r\n    &lt;/servlet&gt;\r\n    &lt;servlet-mapping&gt;\r\n        &lt;servlet-name&gt;HelloServlet&lt;/servlet-name&gt;\r\n        &lt;url-pattern&gt;/servlet/hello&lt;/url-pattern&gt;\r\n    &lt;/servlet-mapping&gt;\r\n&lt;/web-app&gt;\r\n</code></pre><h2 id=\"h2-u6D4Bu8BD5u8FD0u884C\"><a name=\"测试运行\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>测试运行</h2><p>打开浏览器访问<a href=\"http://localhost:8080\">http://localhost:8080</a> 显示如下：</p>\r\n<blockquote>\r\n<p>Hello Maven</p>\r\n</blockquote>\r\n',4,0,1,1,1,'2019-01-13 21:56:53','2019-01-13 21:56:53');

/*Table structure for table `article_category_ref` */

DROP TABLE IF EXISTS `article_category_ref`;

CREATE TABLE `article_category_ref` (
  `article_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article_category_ref` */

insert  into `article_category_ref`(`article_id`,`category_id`) values 
(93,100000013),
(93,100000015),
(95,100000015),
(95,100000013),
(98,100000013),
(98,100000015),
(97,100000015),
(97,100000013),
(96,100000013),
(96,100000015),
(94,100000013),
(94,100000015),
(99,100000015),
(99,100000013),
(100,100000015),
(100,100000013),
(92,100000013),
(92,100000014),
(91,100000013),
(91,100000014),
(102,100000013),
(102,100000015),
(101,100000013),
(101,100000015);

/*Table structure for table `article_tag_ref` */

DROP TABLE IF EXISTS `article_tag_ref`;

CREATE TABLE `article_tag_ref` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article_tag_ref` */

insert  into `article_tag_ref`(`article_id`,`tag_id`) values 
(91,43),
(91,44),
(92,43),
(92,44),
(93,43),
(93,45),
(94,43),
(94,45),
(95,43),
(95,45),
(96,43),
(96,45),
(97,43),
(97,45),
(98,43),
(98,45),
(99,43),
(99,45),
(100,43),
(100,45),
(101,43),
(101,45),
(102,43);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_pid` int(11) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_order` int(11) unsigned DEFAULT '1',
  `category_icon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=100000016 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_pid`,`category_name`,`category_description`,`category_order`,`category_icon`) values 
(100000011,100000010,'Test1','test1',2,'fa '),
(100000013,0,'Java','Java ',10,'fa fa-columns'),
(100000014,100000013,'Intellij IDEA','开发工具',10,'fa fa-circle-o-notch'),
(100000015,100000013,'Maven','Maven',9,'fa fa-laptop');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(255) DEFAULT NULL,
  `notice_html` varchar(10000) DEFAULT NULL,
  `notice_content` varchar(10000) DEFAULT NULL,
  `notice_create_time` datetime DEFAULT NULL,
  `notice_update_time` datetime DEFAULT NULL,
  `notice_status` int(1) unsigned DEFAULT '1',
  `notice_order` int(2) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`notice_id`,`notice_title`,`notice_html`,`notice_content`,`notice_create_time`,`notice_update_time`,`notice_status`,`notice_order`) values 
(3,'本站开始编写','2019-01-12 15:28:28 星期六\r\n\r\n开始编写本项目','<p>2019-01-12 15&#58;28&#58;28 星期六</p>\r\n<p>开始编写本项目</p>\r\n','2019-01-12 15:28:42','2019-01-12 15:28:42',1,3);

/*Table structure for table `options` */

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `option_id` int(11) NOT NULL,
  `option_site_title` varchar(255) DEFAULT NULL,
  `option_site_descrption` varchar(255) DEFAULT NULL,
  `option_meta_descrption` varchar(255) DEFAULT NULL,
  `option_meta_keyword` varchar(255) DEFAULT NULL,
  `option_aboutsite_avatar` varchar(255) DEFAULT NULL,
  `option_aboutsite_title` varchar(255) DEFAULT NULL,
  `option_aboutsite_content` varchar(255) DEFAULT NULL,
  `option_aboutsite_wechat` varchar(255) DEFAULT NULL,
  `option_aboutsite_qq` varchar(255) DEFAULT NULL,
  `option_aboutsite_github` varchar(255) DEFAULT NULL,
  `option_aboutsite_weibo` varchar(255) DEFAULT NULL,
  `option_tongji` varchar(255) DEFAULT NULL,
  `option_status` int(1) DEFAULT '1',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `options` */

insert  into `options`(`option_id`,`option_site_title`,`option_site_descrption`,`option_meta_descrption`,`option_meta_keyword`,`option_aboutsite_avatar`,`option_aboutsite_title`,`option_aboutsite_content`,`option_aboutsite_wechat`,`option_aboutsite_qq`,`option_aboutsite_github`,`option_aboutsite_weibo`,`option_tongji`,`option_status`) values 
(1,'Yuu Blog','莫问收获，但问耕耘。','有道无术，术尚可求，有术无道，止于术','Yuu Blog, SSM Blog','http://localhost:8080/static/upload/1adc0ce1-0345-4348-9f97-a1f1a18b7ca6.jpg','Yuu','有道无术，术尚可求，有术无道，止于术','http://localhost:8080/static/upload/84b53399-3dce-4c74-906d-9ffb4754981b.png','1225459207','qq_37581282','yuu0701',NULL,1);

/*Table structure for table `page` */

DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_key` varchar(50) DEFAULT NULL,
  `page_title` varchar(50) DEFAULT NULL,
  `page_html` mediumtext,
  `page_content` mediumtext,
  `page_create_time` datetime DEFAULT NULL,
  `page_update_time` datetime DEFAULT NULL,
  `page_view_count` int(10) unsigned DEFAULT '0',
  `page_comment_count` int(5) unsigned DEFAULT '0',
  `page_status` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `page` */

insert  into `page`(`page_id`,`page_key`,`page_title`,`page_html`,`page_content`,`page_create_time`,`page_update_time`,`page_view_count`,`page_comment_count`,`page_status`) values 
(11,'aboutSite','关于我们','# 关于项目\r\n该项目是小组粗略学完 SSM (Spring + SpringMVC + Mybatis) 后，开始写的一个博客系统，主要涉及的知识包括， JSP， JSTL， EL 表达式，MySQL， Druid 连接池， Spring， SpringMVC， Mybatis 等。前端采用了 Layui。通过 Maven 管理依赖。使用 jdk 1.8 + tomcat 8.0 + mysql 5.6 + maven 3.6 idea 开发。\r\n\r\n# 效果预览\r\n\r\n前台效果图\r\n![](http://localhost:8080/static/upload/2dd00c82-d665-4da3-90ee-e6379c92b156.png)\r\n\r\n后台效果图\r\n![](http://localhost:8080/static/upload/c0d45f46-b8cf-4a61-9382-265be06c89ff.png)\r\n\r\n后台地址：/admin/login\r\n\r\n用户名 yuu, 密码为 123456\r\n\r\n\r\n\r\n','<h1 id=\"h1-u5173u4E8Eu9879u76EE\"><a name=\"关于项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>关于项目</h1><p>该项目是小组粗略学完 SSM (Spring + SpringMVC + Mybatis) 后，开始写的一个博客系统，主要涉及的知识包括， JSP， JSTL， EL 表达式，MySQL， Druid 连接池， Spring， SpringMVC， Mybatis 等。前端采用了 Layui。通过 Maven 管理依赖。使用 jdk 1.8 + tomcat 8.0 + mysql 5.6 + maven 3.6 idea 开发。</p>\r\n<h1 id=\"h1-u6548u679Cu9884u89C8\"><a name=\"效果预览\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>效果预览</h1><p>前台效果图<br><img src=\"http://localhost:8080/static/upload/2dd00c82-d665-4da3-90ee-e6379c92b156.png\" alt=\"\"></p>\r\n<p>后台效果图<br><img src=\"http://localhost:8080/static/upload/c0d45f46-b8cf-4a61-9382-265be06c89ff.png\" alt=\"\"></p>\r\n<p>后台地址：/admin/login</p>\r\n<p>用户名 yuu, 密码为 123456</p>\r\n','2019-01-12 15:24:04','2019-01-13 22:28:33',0,0,1);

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) DEFAULT NULL,
  `tag_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `tag` */

insert  into `tag`(`tag_id`,`tag_name`,`tag_description`) values 
(43,'Java','Java'),
(44,'IDEA','Intellij IDEA'),
(45,'Maven','Maven ');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nickname` varchar(255) NOT NULL DEFAULT '',
  `user_email` varchar(100) DEFAULT '',
  `user_url` varchar(100) DEFAULT '',
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_last_login_ip` varchar(255) DEFAULT NULL,
  `user_register_time` datetime DEFAULT NULL,
  `user_last_login_time` datetime DEFAULT NULL,
  `user_status` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_pass`,`user_nickname`,`user_email`,`user_url`,`user_avatar`,`user_last_login_ip`,`user_register_time`,`user_last_login_time`,`user_status`) values 
(1,'yuu','c33367701511b4f6020ec61ded352059','yuu','1225459207@qq.com','http://www.yyhsite.xin','http://localhost:8080/static/upload/65435b69-0ad2-41cb-b24e-ca3fcd4025e6.jpg','0:0:0:0:0:0:0:1','2019-01-10 00:30:50','2019-01-17 15:34:49',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
