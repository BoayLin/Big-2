# Big Two in Java

這是一個 Java Swing + FlatLaf 版的大老二專案。

## 規則

- 使用 52 張牌，4 名玩家，各發 13 張。
- 起始玩家是持有 `3D` 的玩家。
- 第一手必須包含 `3D`。
- 支援的牌型：單張、對子、三條、順子、同花、葫蘆、鐵支、同花順。
- 同牌型比大小，五張牌牌型強度依序為：順子 < 同花 < 葫蘆 < 鐵支 < 同花順。

## 執行

如果你有 Maven：

```bash
mvn test
mvn exec:java -Dexec.mainClass=com.example.big2.Main
```

如果你只有 JDK，也可以直接編譯執行：

```bash
javac -d target/classes (Get-ChildItem -Recurse -Filter *.java src/main/java,src/test/java).FullName
java -cp target/classes com.example.big2.Main
```

如果你是在這個工作區直接跑，`lib/` 內已放入 FlatLaf 依賴 JAR，`javac` 也可以加上：

```bash
javac -cp "lib/flatlaf-3.6.jar;lib/flatlaf-extras-3.6.jar" -d target/classes ...
```

也可以直接用 IDE 執行 `com.example.big2.Main`。

## Docker

這個專案有提供 `Dockerfile` 和 `docker-compose.yml`。

```bash
docker compose up --build
```

這是一個桌面 GUI 程式，容器內會啟動 Xvfb + VNC。請用 VNC client 連到 `localhost:5900` 觀看畫面。
