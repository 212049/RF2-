# RF2T - RF2 Telemetry Display & Flight Log System
# RF2T - 基于RF2的遥测显示与飞行日志系统

**Version / 版本:** 2.1  
**Author / 作者:** RFDB  
**Platform / 平台:** EdgeTX / OpenTX (128x64 LCD Display)

---

## Table of Contents / 目录

1. [Introduction / 简介](#introduction--简介)
2. [Features / 功能特性](#features--功能特性)
3. [Installation / 安装](#installation--安装)
4. [User Interface / 用户界面](#user-interface--用户界面)
5. [Operation Guide / 操作指南](#operation-guide--操作指南)
6. [Log File Structure / 日志文件结构](#log-file-structure--日志文件结构)
7. [Configuration / 配置](#configuration--配置)
8. [Troubleshooting / 故障排除](#troubleshooting--故障排除)
9. [FAQ / 常见问题](#faq--常见问题)

---

## Introduction / 简介

### English

RF2T is a comprehensive telemetry display and flight logging system designed for EdgeTX/OpenTX radio systems. It provides real-time flight data visualization, automatic flight logging, and powerful log management capabilities. Ideal for RC helicopter pilots who want to track their flights and analyze performance data.

**Key Highlights:**
- Real-time telemetry monitoring with intuitive display
- Automatic flight log recording with multi-model support
- Advanced log browsing by date and model
- Flight statistics tracking across all models
- Low memory footprint with optimized performance

### 中文

RF2T 是一个为 EdgeTX/OpenTX 遥控系统设计的综合遥测显示和飞行日志系统。它提供实时飞行数据可视化、自动飞行日志记录以及强大的日志管理功能。非常适合希望跟踪飞行并分析性能数据的遥控直升机飞手。

**核心亮点：**
- 实时遥测监控，界面直观
- 自动飞行日志记录，支持多机型
- 按日期和机型浏览高级日志
- 跨所有机型的飞行统计追踪
- 低内存占用，性能优化

---

## Features / 功能特性

### English

#### 1. **Real-time Telemetry Display**
- Battery voltage (Vbat) with visual indicator
- Current draw (Curr) with peak tracking
- Main rotor head speed (Hspd) in RPM
- Battery capacity used (Capa) in mAh
- Battery percentage (Bat%)
- ESC temperature (Tesc)
- Throttle position (Thr)
- RF signal strength (RSS)
- BEC voltage (Vbec)
- Governor state display (GOV)

#### 2. **Automatic Flight Logging**
- Logs automatically saved after each flight
- Minimum flight time threshold: 30 seconds
- Records per flight:
  - Date and model name
  - Flight duration
  - Battery voltage (min)
  - Current (max)
  - Consumed capacity
  - Power (max)
  - RPM (max)
  - BEC voltage (min)
  - Flight number (daily & total)

#### 3. **Log Management**
- Browse logs by date
- Multi-model support with separate folders
- Calendar view for selecting specific dates
- Scan up to 365 days of history
- Automatic statistics generation
- Model-specific flight counters

#### 4. **Flight Timer**
- Automatic start/stop based on arming status
- Minute-by-minute voice announcements
- Pause/resume capability
- Large, easy-to-read display

#### 5. **Post-Flight Summary**
- Automatic pop-up after landing
- Shows key flight statistics
- Flight duration and date
- Battery and power metrics
- Total flight count for the model

### 中文

#### 1. **实时遥测显示**
- 电池电压（Vbat）带可视化指示器
- 电流消耗（Curr）带峰值追踪
- 主旋翼头速（Hspd）单位 RPM
- 电池容量消耗（Capa）单位 mAh
- 电池百分比（Bat%）
- 电调温度（Tesc）
- 油门位置（Thr）
- RF 信号强度（RSS）
- BEC 电压（Vbec）
- 调速器状态显示（GOV）

#### 2. **自动飞行日志记录**
- 每次飞行后自动保存日志
- 最小飞行时间阈值：30 秒
- 每次飞行记录：
  - 日期和机型名称
  - 飞行时长
  - 电池电压（最低）
  - 电流（最大）
  - 消耗容量
  - 功率（最大）
  - 转速（最大）
  - BEC 电压（最低）
  - 飞行编号（当日及总计）

#### 3. **日志管理**
- 按日期浏览日志
- 多机型支持，独立文件夹
- 日历视图选择特定日期
- 扫描最多 365 天历史记录
- 自动生成统计数据
- 机型专属飞行计数器

#### 4. **飞行计时器**
- 基于解锁状态自动启动/停止
- 每分钟语音播报
- 暂停/恢复功能
- 大字体易读显示

#### 5. **飞行后摘要**
- 降落后自动弹出
- 显示关键飞行统计
- 飞行时长和日期
- 电池和功率指标
- 机型总飞行次数

---

## Installation / 安装

### English

#### Prerequisites
1. EdgeTX or OpenTX compatible radio transmitter
2. 128x64 pixel LCD screen
3. Telemetry receiver with following sensors:
   - Vbat (Battery Voltage)
   - Curr (Current)
   - Hspd (Head Speed)
   - Capa (Capacity)
   - Bat% (Battery Percentage)
   - Tesc (ESC Temperature)
   - 1RSS (RF Signal)
   - Vbec (BEC Voltage)
   - GOV (Governor State)

#### Installation Steps

1. **Copy Script File**
   ```
   Copy rf2t.lua to: /SCRIPTS/TELEMETRY/
   ```

2. **Configure Model**
   - Open Model Setup in your radio
   - Navigate to: DISPLAY → Screen 1
   - Select Script: `rf2t.lua`
   - Exit and save

3. **Create Log Directory** (Optional - will auto-create)
   ```
   Create folder: /LOGS/
   ```

4. **Configure Telemetry Sensors**
   - Ensure all required sensors are properly named
   - Verify sensor IDs match the script expectations:
     - Vbat, Curr, Hspd, Capa, Bat%, Tesc, 1RSS, Vbec, GOV

5. **Test Run**
   - Power on receiver
   - Long press PAGE button to view telemetry screen
   - Verify data display

### 中文

#### 前置要求
1. EdgeTX 或 OpenTX 兼容的遥控发射器
2. 128x64 像素 LCD 屏幕
3. 带以下传感器的遥测接收器：
   - Vbat（电池电压）
   - Curr（电流）
   - Hspd（头速）
   - Capa（容量）
   - Bat%（电池百分比）
   - Tesc（电调温度）
   - 1RSS（RF 信号）
   - Vbec（BEC 电压）
   - GOV（调速器状态）

#### 安装步骤

1. **复制脚本文件**
   ```
   将 rf2t.lua 复制到：/SCRIPTS/TELEMETRY/
   ```

2. **配置机型**
   - 在遥控器中打开机型设置
   - 导航至：显示 → 屏幕 1
   - 选择脚本：`rf2t.lua`
   - 退出并保存

3. **创建日志目录**（可选 - 会自动创建）
   ```
   创建文件夹：/LOGS/
   ```

4. **配置遥测传感器**
   - 确保所有必需的传感器命名正确
   - 验证传感器 ID 符合脚本预期：
     - Vbat, Curr, Hspd, Capa, Bat%, Tesc, 1RSS, Vbec, GOV

5. **测试运行**
   - 打开接收器电源
   - 长按 PAGE 按钮查看遥测屏幕
   - 验证数据显示

---

## User Interface / 用户界面

### English

The system has **4 main screens**:

#### **Page 0: Main Telemetry Screen** (Default)

```
┌──────────────────────────────────────────┐
│ [Model Name]  [GOV State]   [TX Bat]    │
├──────────────┬───────────────────────────┤
│ [Battery %]  │                           │
│ [Voltage]    │    [RPM Display]          │
│ [Capacity]   │    Large Center           │
│ [Current]    │                           │
│              │    [Throttle]             │
│              │    [ESC Temp]             │
├──────────────┼───────────────────────────┤
│              │ Time: [MM:SS]             │
│              │ BEC:  [Voltage]           │
│              │ Signal: [RSSI]            │
└──────────────┴───────────────────────────┘
```

**Layout Description:**
- **Top Bar:** Model name, Governor state, TX battery
- **Left Column:** Battery percentage indicator, Voltage, Capacity, Current
- **Center Column:** Large RPM display, Throttle percentage, ESC temperature
- **Right Column:** Flight timer, BEC voltage, Signal strength

#### **Page 1: Flight Log List**

```
┌──────────────────────────────────────────┐
│ [Date]                    [X Flights]    │
├──────────┬───────────────────────────────┤
│ 01 Model │ 05:23        ┊ Bat: XX.XV     │
│ 02 Model │ 03:45        ┊ Cap: XXXXmAh   │
│→03 Model │ 10:12        ┊ Cur: XX.XA     │
│ 04 Model │ 02:30        ┊ RPM: XXXX      │
│ 05 Model │ 08:15        ┊                │
└──────────┴───────────────────────────────┘
```

**Features:**
- Scrollable list of flights for selected date
- Shows model name and flight duration
- Selected flight highlighted with arrow
- Right panel shows quick stats for selected flight
- Press ENTER to view detailed info

#### **Page 2: Date Selection**

```
┌──────────────────────────────────────────┐
│ Select Month          [X Months]         │
├──────────────┬───────────────────────────┤
│   2025-02    │                           │
│ → 2025-01    │   Select Month            │
│   2024-12    │                           │
│   2024-11    │                           │
└──────────────┴───────────────────────────┘

After selecting month:
┌──────────────────────────────────────────┐
│ 2025-01                [X Days]          │
├──────────────┬───────────────────────────┤
│   2025-01    │ → 15                      │
│              │   10                      │
│              │   05                      │
│              │   01                      │
└──────────────┴───────────────────────────┘
```

**Navigation:**
- Left column: Select month
- Right column: Select specific day in month
- First time entering: Shows scanning progress bar
- Scans up to 365 days of log history

#### **Page 3: Log Detail View**

```
┌──────────────────────────────────────────┐
│ Log Detail                [N/Total]      │
├──────────────────┬───────────────────────┤
│ Model: XXX       │ ⚡ Power: XXXW        │
│ Time: MM:SS      │ ⚙ RPM: XXXX           │
│ Today#: X        │ 🔋 BEC: XX.XV         │
│ Total: XXX       │ 🔋 MinV: XX.XV        │
│                  │ ⚡ MaxI: XX.XA         │
│                  │ 🔋 Capa: XXXXmAh      │
└──────────────────┴───────────────────────┘
```

**Information Displayed:**
- **Left:** Model name, Flight duration, Daily flight number, Total flights
- **Right:** Max power, Max RPM, Min BEC voltage, Min battery voltage, Max current, Consumed capacity

#### **Post-Flight Summary Board**

Automatically appears after landing (when signal lost):

```
┌──────────────────────────────────────────┐
│ MM:SS     2025-01-15         [Count]     │
├──────────────────────────────────────────┤
│ 🔋 XXXXmAh       ┊ 🔋 XX.XV              │
│ ⚡ XX.XA         ┊ ⚡ XXXW                │
│ ⚙ XXXXRPM       ┊ 🔋 XX.XV               │
│ Total: XXX      ┊                        │
└──────────────────────────────────────────┘
```

### 中文

系统有 **4 个主屏幕**：

#### **页面 0：主遥测屏幕**（默认）

```
┌──────────────────────────────────────────┐
│ [机型名称]  [调速器状态]   [发射机电池]  │
├──────────────┬───────────────────────────┤
│ [电池百分比] │                           │
│ [电压]       │    [转速显示]             │
│ [容量]       │    大字居中               │
│ [电流]       │                           │
│              │    [油门]                 │
│              │    [电调温度]             │
├──────────────┼───────────────────────────┤
│              │ 时间: [分:秒]             │
│              │ BEC:  [电压]              │
│              │ 信号: [强度]              │
└──────────────┴───────────────────────────┘
```

**布局说明：**
- **顶栏：** 机型名称、调速器状态、发射机电池
- **左列：** 电池百分比指示器、电压、容量、电流
- **中列：** 大字转速显示、油门百分比、电调温度
- **右列：** 飞行计时器、BEC 电压、信号强度

#### **页面 1：飞行日志列表**

```
┌──────────────────────────────────────────┐
│ [日期]                    [X 次飞行]     │
├──────────┬───────────────────────────────┤
│ 01 机型  │ 05:23        ┊ 电压: XX.XV    │
│ 02 机型  │ 03:45        ┊ 容量: XXXXmAh  │
│→03 机型  │ 10:12        ┊ 电流: XX.XA    │
│ 04 机型  │ 02:30        ┊ 转速: XXXX     │
│ 05 机型  │ 08:15        ┊                │
└──────────┴───────────────────────────────┘
```

**功能：**
- 可滚动的选定日期飞行列表
- 显示机型名称和飞行时长
- 选中的飞行用箭头高亮
- 右侧面板显示选中飞行的快速统计
- 按 ENTER 查看详细信息

#### **页面 2：日期选择**

```
┌──────────────────────────────────────────┐
│ 选择月份                  [X 月]         │
├──────────────┬───────────────────────────┤
│   2025-02    │                           │
│ → 2025-01    │   选择月份                │
│   2024-12    │                           │
│   2024-11    │                           │
└──────────────┴───────────────────────────┘

选择月份后：
┌──────────────────────────────────────────┐
│ 2025-01                [X 天]            │
├──────────────┬───────────────────────────┤
│   2025-01    │ → 15                      │
│              │   10                      │
│              │   05                      │
│              │   01                      │
└──────────────┴───────────────────────────┘
```

**导航：**
- 左列：选择月份
- 右列：选择月份中的特定日期
- 首次进入：显示扫描进度条
- 扫描最多 365 天的日志历史

#### **页面 3：日志详细视图**

```
┌──────────────────────────────────────────┐
│ 日志详情                  [N/总数]       │
├──────────────────┬───────────────────────┤
│ 机型: XXX        │ ⚡ 功率: XXXW         │
│ 时间: 分:秒      │ ⚙ 转速: XXXX          │
│ 今日#: X         │ 🔋 BEC: XX.XV         │
│ 总计: XXX        │ 🔋 最低V: XX.XV       │
│                  │ ⚡ 最大I: XX.XA        │
│                  │ 🔋 容量: XXXXmAh      │
└──────────────────┴───────────────────────┘
```

**显示信息：**
- **左侧：** 机型名称、飞行时长、当日飞行编号、总飞行次数
- **右侧：** 最大功率、最大转速、最低 BEC 电压、最低电池电压、最大电流、消耗容量

#### **飞行后摘要面板**

降落后（信号丢失时）自动显示：

```
┌──────────────────────────────────────────┐
│ 分:秒     2025-01-15         [次数]      │
├──────────────────────────────────────────┤
│ 🔋 XXXXmAh       ┊ 🔋 XX.XV              │
│ ⚡ XX.XA         ┊ ⚡ XXXW                │
│ ⚙ XXXXRPM       ┊ 🔋 XX.XV               │
│ 总计: XXX       ┊                        │
└──────────────────────────────────────────┘
```

---

## Operation Guide / 操作指南

### English

#### Basic Operations

| Button | Page 0 | Page 1 (Log List) | Page 2 (Date Select) | Page 3 (Detail) |
|--------|--------|-------------------|----------------------|-----------------|
| **MENU** | Go to Log List | Go to Date Select | - | - |
| **EXIT** | Close Summary | Back to Page 0 | Back to Page 1 / Back to Month | Back to Log List |
| **ENTER** | Close Summary | View Detail | Select Month/Date | Back to Log List |
| **Scroll** | - | Navigate Logs | Navigate Month/Date | - |

#### Flight Operation Workflow

1. **Pre-Flight**
   - Power on TX and RX
   - Verify telemetry connection (model name shows, "RX LOSS" disappears)
   - Check all sensor readings are valid
   - Note current flight count displayed

2. **During Flight**
   - Timer starts automatically when armed (CH5 > 0)
   - Voice announces every minute
   - Real-time data updates continuously
   - Governor state displayed at top

3. **Post-Flight**
   - Timer pauses when disarmed
   - After disconnect (30+ second flight), summary board appears automatically
   - Review flight data on summary board
   - Press EXIT or ENTER to close summary
   - Flight automatically logged to SD card

4. **Log Review**
   - Press MENU to access log list (Page 1)
   - Scroll through today's flights
   - Press ENTER on any flight to view details (Page 3)
   - Press MENU from log list to access date browser (Page 2)

#### Advanced Operations

**Browsing Historical Logs:**

1. From Page 0, press MENU → enters Page 1
2. From Page 1, press MENU → enters Page 2 (Date Select)
3. First time: Automatic scanning starts (progress bar shown)
4. Scroll to select desired month, press ENTER
5. Scroll to select desired day, press ENTER
6. View logs for that date in Page 1
7. Press EXIT to go back to month selection
8. Press EXIT again to return to current date

**Managing Statistics:**

The system automatically generates flight statistics in `/LOGS/RFStats.csv`. This file tracks total flights per model. If statistics are missing:

1. Delete `/LOGS/RFStats.csv`
2. Restart the script
3. System will automatically rescan all logs (may take time)
4. Progress shown on Page 2 when accessed

**Closing Post-Flight Summary:**

- Press EXIT or ENTER to close
- Or wait for connection reestablishment (summary auto-closes)

### 中文

#### 基本操作

| 按钮 | 页面 0 | 页面 1（日志列表）| 页面 2（日期选择）| 页面 3（详情）|
|------|--------|-------------------|-------------------|---------------|
| **MENU** | 进入日志列表 | 进入日期选择 | - | - |
| **EXIT** | 关闭摘要 | 返回页面 0 | 返回页面 1 / 返回月份 | 返回日志列表 |
| **ENTER** | 关闭摘要 | 查看详情 | 选择月份/日期 | 返回日志列表 |
| **滚轮** | - | 浏览日志 | 浏览月份/日期 | - |

#### 飞行操作流程

1. **飞行前**
   - 打开发射机和接收机
   - 验证遥测连接（显示机型名称，"RX LOSS"消失）
   - 检查所有传感器读数有效
   - 注意显示的当前飞行次数

2. **飞行中**
   - 解锁时（CH5 > 0）计时器自动启动
   - 每分钟语音播报
   - 实时数据持续更新
   - 顶部显示调速器状态

3. **飞行后**
   - 锁定时计时器暂停
   - 断开连接后（30+ 秒飞行），摘要面板自动出现
   - 在摘要面板上查看飞行数据
   - 按 EXIT 或 ENTER 关闭摘要
   - 飞行自动记录到 SD 卡

4. **日志查看**
   - 按 MENU 访问日志列表（页面 1）
   - 滚动浏览今天的飞行
   - 在任何飞行上按 ENTER 查看详情（页面 3）
   - 从日志列表按 MENU 访问日期浏览器（页面 2）

#### 高级操作

**浏览历史日志：**

1. 从页面 0，按 MENU → 进入页面 1
2. 从页面 1，按 MENU → 进入页面 2（日期选择）
3. 首次：自动扫描开始（显示进度条）
4. 滚动选择所需月份，按 ENTER
5. 滚动选择所需日期，按 ENTER
6. 在页面 1 中查看该日期的日志
7. 按 EXIT 返回月份选择
8. 再次按 EXIT 返回当前日期

**管理统计：**

系统自动在 `/LOGS/RFStats.csv` 中生成飞行统计。此文件跟踪每个机型的总飞行次数。如果统计丢失：

1. 删除 `/LOGS/RFStats.csv`
2. 重启脚本
3. 系统将自动重新扫描所有日志（可能需要时间）
4. 访问页面 2 时显示进度

**关闭飞行后摘要：**

- 按 EXIT 或 ENTER 关闭
- 或等待连接重新建立（摘要自动关闭）

---

## Log File Structure / 日志文件结构

### English

#### Directory Structure

```
/LOGS/
├── RFStats.csv              # Statistics file
├── ModelName1/              # Model-specific folder
│   ├── RFLog_20250115.csv   # Daily log for this model
│   ├── RFLog_20250114.csv
│   └── ...
├── ModelName2/
│   ├── RFLog_20250115.csv
│   └── ...
└── RFLog_YYYYMMDD.csv       # Legacy format (mixed models)
```

**New Format (Recommended):** `/LOGS/ModelName/RFLog_YYYYMMDD.csv`
**Old Format (Legacy):** `/LOGS/RFLog_YYYYMMDD.csv`

The script automatically supports both formats for backward compatibility.

#### Log File Format (CSV)

Each log entry contains 11 fields separated by `|`:

```
Date|Model|Time|DailyFlight#|Capacity|MinVolt|MaxCurrent|MaxPower|MaxRPM|MinBEC|TotalFlights
```

**Example:**
```
20250115|RFDB2.1|05:23|1|2450|22.3|65.2|1450|2650|7.8|147
20250115|RFDB2.1|03:45|2|1820|22.5|58.3|1320|2580|7.9|148
```

**Field Descriptions:**

| Field | Type | Description | Unit |
|-------|------|-------------|------|
| 1. Date | String | Date in YYYYMMDD format | - |
| 2. Model | String | Model name | - |
| 3. Time | String | Flight duration MM:SS | - |
| 4. DailyFlight# | Integer | Flight number for the day | - |
| 5. Capacity | Integer | Consumed capacity | mAh |
| 6. MinVolt | Float | Minimum battery voltage | V |
| 7. MaxCurrent | Float | Maximum current draw | A |
| 8. MaxPower | Integer | Maximum power | W |
| 9. MaxRPM | Integer | Maximum head speed | RPM |
| 10. MinBEC | Float | Minimum BEC voltage | V |
| 11. TotalFlights | Integer | Total flights for this model | - |

#### Statistics File Format

`/LOGS/RFStats.csv` contains flight counters for all models:

```
ModelName1|147
ModelName2|89
ModelName3|256
```

Format: `ModelName|FlightCount`

This file is automatically generated and updated by the script.

### 中文

#### 目录结构

```
/LOGS/
├── RFStats.csv              # 统计文件
├── 机型名称1/                # 机型专属文件夹
│   ├── RFLog_20250115.csv   # 该机型的每日日志
│   ├── RFLog_20250114.csv
│   └── ...
├── 机型名称2/
│   ├── RFLog_20250115.csv
│   └── ...
└── RFLog_YYYYMMDD.csv       # 旧格式（混合机型）
```

**新格式（推荐）：** `/LOGS/机型名称/RFLog_YYYYMMDD.csv`
**旧格式（兼容）：** `/LOGS/RFLog_YYYYMMDD.csv`

脚本自动支持两种格式以实现向后兼容。

#### 日志文件格式（CSV）

每个日志条目包含 11 个用 `|` 分隔的字段：

```
日期|机型|时间|当日飞行#|容量|最低电压|最大电流|最大功率|最大转速|最低BEC|总飞行次数
```

**示例：**
```
20250115|RFDB2.1|05:23|1|2450|22.3|65.2|1450|2650|7.8|147
20250115|RFDB2.1|03:45|2|1820|22.5|58.3|1320|2580|7.9|148
```

**字段说明：**

| 字段 | 类型 | 说明 | 单位 |
|------|------|------|------|
| 1. 日期 | 字符串 | YYYYMMDD 格式的日期 | - |
| 2. 机型 | 字符串 | 机型名称 | - |
| 3. 时间 | 字符串 | 飞行时长 MM:SS | - |
| 4. 当日飞行# | 整数 | 当天的飞行编号 | - |
| 5. 容量 | 整数 | 消耗容量 | mAh |
| 6. 最低电压 | 浮点 | 最低电池电压 | V |
| 7. 最大电流 | 浮点 | 最大电流消耗 | A |
| 8. 最大功率 | 整数 | 最大功率 | W |
| 9. 最大转速 | 整数 | 最大头速 | RPM |
| 10. 最低BEC | 浮点 | 最低 BEC 电压 | V |
| 11. 总飞行次数 | 整数 | 该机型的总飞行次数 | - |

#### 统计文件格式

`/LOGS/RFStats.csv` 包含所有机型的飞行计数器：

```
机型名称1|147
机型名称2|89
机型名称3|256
```

格式：`机型名称|飞行次数`

此文件由脚本自动生成和更新。

---

## Configuration / 配置

### English

#### Script Parameters (Top of rf2t.lua)

You can customize these parameters by editing the script:

```lua
local MAX_LOG_ENTRIES = 99           -- Max logs to display per day
local MIN_FLIGHT_TIME_SEC = 30       -- Minimum flight time to log (seconds)
local SCAN_STATS_BATCH_SIZE = 3      -- Files to scan per cycle (stats)
local SCAN_LOGS_BATCH_SIZE = 5       -- Files to scan per cycle (logs)
local SCAN_TOTAL_DAYS = 365          -- Total days to scan back
local STATS_SCAN_PHASE2_BATCH_SIZE = 2  -- Phase 2 scan batch size
```

**Parameter Descriptions:**

- **MAX_LOG_ENTRIES**: Maximum number of log entries to load for one day. Reduce if experiencing memory issues.
- **MIN_FLIGHT_TIME_SEC**: Flights shorter than this duration won't be logged. Prevents logging brief connection tests.
- **SCAN_STATS_BATCH_SIZE**: How many files to scan per background cycle when building statistics. Higher = faster scan but may cause lag.
- **SCAN_LOGS_BATCH_SIZE**: How many files to scan per cycle when building date index. Higher = faster but may lag.
- **SCAN_TOTAL_DAYS**: How far back in history to scan. 365 = 1 year. Reduce to improve scan speed.
- **STATS_SCAN_PHASE2_BATCH_SIZE**: Batch size for phase 2 of statistics scan. Reduce if experiencing lag.

#### Telemetry Sensor Names

The script expects sensors with these exact names. If your sensors have different names, edit this section:

```lua
local teleItemName = { 
    "Vbat",   -- Battery Voltage
    "Curr",   -- Current
    "Hspd",   -- Head Speed (RPM)
    "Capa",   -- Capacity Used
    "Bat%",   -- Battery Percentage
    "Tesc",   -- ESC Temperature
    "Thr",    -- Throttle
    "1RSS",   -- RF Signal Strength
    "Vbec",   -- BEC Voltage
    "GOV"     -- Governor State
}
```

#### Governor States

The script displays text for governor states. These correspond to numeric values from the GOV sensor:

```lua
local gov_state_names = { 
    "OFF",      -- 1
    "IDLE",     -- 2
    "SPOOLUP",  -- 3
    "RECOVERY", -- 4
    "ACTIVE",   -- 5
    "THR-OFF",  -- 6
    "LOST-HS",  -- 7
    "AUTOROT",  -- 8
    "BAILOUT"   -- 9
}
```

Customize these strings to match your preferred language or abbreviations.

### 中文

#### 脚本参数（rf2t.lua 顶部）

您可以通过编辑脚本自定义这些参数：

```lua
local MAX_LOG_ENTRIES = 99           -- 每天显示的最大日志数
local MIN_FLIGHT_TIME_SEC = 30       -- 记录的最小飞行时间（秒）
local SCAN_STATS_BATCH_SIZE = 3      -- 每周期扫描的文件数（统计）
local SCAN_LOGS_BATCH_SIZE = 5       -- 每周期扫描的文件数（日志）
local SCAN_TOTAL_DAYS = 365          -- 向后扫描的总天数
local STATS_SCAN_PHASE2_BATCH_SIZE = 2  -- 第二阶段扫描批量大小
```

**参数说明：**

- **MAX_LOG_ENTRIES**：单日加载的最大日志条目数。如遇内存问题可减少。
- **MIN_FLIGHT_TIME_SEC**：短于此时长的飞行不会被记录。防止记录短暂的连接测试。
- **SCAN_STATS_BATCH_SIZE**：构建统计时每个后台周期扫描多少文件。越高 = 扫描越快但可能卡顿。
- **SCAN_LOGS_BATCH_SIZE**：构建日期索引时每个周期扫描多少文件。越高 = 越快但可能卡顿。
- **SCAN_TOTAL_DAYS**：向后扫描历史多远。365 = 1 年。减少可提高扫描速度。
- **STATS_SCAN_PHASE2_BATCH_SIZE**：统计扫描第二阶段的批量大小。如遇卡顿可减少。

#### 遥测传感器名称

脚本期望使用这些确切名称的传感器。如果您的传感器名称不同，请编辑此部分：

```lua
local teleItemName = { 
    "Vbat",   -- 电池电压
    "Curr",   -- 电流
    "Hspd",   -- 头速（RPM）
    "Capa",   -- 使用容量
    "Bat%",   -- 电池百分比
    "Tesc",   -- 电调温度
    "Thr",    -- 油门
    "1RSS",   -- RF 信号强度
    "Vbec",   -- BEC 电压
    "GOV"     -- 调速器状态
}
```

#### 调速器状态

脚本显示调速器状态的文本。这些对应 GOV 传感器的数值：

```lua
local gov_state_names = { 
    "OFF",      -- 1: 关闭
    "IDLE",     -- 2: 怠速
    "SPOOLUP",  -- 3: 启动中
    "RECOVERY", -- 4: 恢复
    "ACTIVE",   -- 5: 激活
    "THR-OFF",  -- 6: 油门关闭
    "LOST-HS",  -- 7: 丢失头速
    "AUTOROT",  -- 8: 自旋
    "BAILOUT"   -- 9: 脱离
}
```

自定义这些字符串以匹配您喜欢的语言或缩写。

---

## Troubleshooting / 故障排除

### English

#### Common Issues and Solutions

**1. "RX LOSS" constantly displayed**
- **Cause:** No telemetry connection
- **Solution:**
  - Check receiver is powered and bound
  - Verify telemetry is enabled on receiver
  - Check sensor wiring
  - Verify 1RSS sensor is transmitting

**2. No logs being saved**
- **Cause:** Flight too short or SD card issue
- **Solution:**
  - Ensure flights are longer than 30 seconds
  - Check SD card is inserted and has free space
  - Verify /LOGS/ folder exists (auto-created if missing)
  - Check SD card is not write-protected

**3. "No logs found!" in date browser**
- **Cause:** No logs exist or scanning incomplete
- **Solution:**
  - Fly some flights first to create logs
  - Wait for scanning to complete (progress bar)
  - Check /LOGS/ folder contains log files
  - Try deleting RFStats.csv to trigger rescan

**4. Total flight count shows 0**
- **Cause:** Statistics file missing or corrupt
- **Solution:**
  - Delete /LOGS/RFStats.csv
  - Restart script
  - Wait for automatic rescan to complete
  - Statistics will rebuild automatically

**5. Script runs slowly or lags**
- **Cause:** Too many log files or large scan batches
- **Solution:**
  - Reduce SCAN_TOTAL_DAYS to 180 or 90
  - Decrease SCAN_LOGS_BATCH_SIZE to 3
  - Decrease SCAN_STATS_BATCH_SIZE to 2
  - Archive old logs to a different folder
  - Consider SD card speed (use Class 10 or better)

**6. Some sensors show wrong values**
- **Cause:** Sensor name mismatch
- **Solution:**
  - Check sensor names in TELEMETRY menu
  - Edit teleItemName array to match your sensors
  - Verify sensor IDs are being discovered (check script line 897-905)

**7. Post-flight summary doesn't appear**
- **Cause:** EXIT pressed before disconnect or flight too short
- **Solution:**
  - Don't press EXIT/ENTER before landing
  - Ensure flight duration > 30 seconds
  - Check closeBoardKey variable not set

**8. Date browser shows wrong dates**
- **Cause:** Radio clock incorrect
- **Solution:**
  - Set correct date/time in radio settings
  - Existing logs will remain with old dates
  - New logs will use correct dates

**9. Memory errors or crashes**
- **Cause:** Too many logs loaded at once
- **Solution:**
  - Reduce MAX_LOG_ENTRIES to 50 or 30
  - Delete very old logs
  - Restart radio to clear memory

**10. Mixed model logs in old format**
- **Cause:** Logs created before model-specific folders
- **Solution:**
  - Use included reorganize_logs.ps1 script
  - On computer, copy script to SD card root
  - Run script to organize logs by model
  - Script will move logs to model folders

### 中文

#### 常见问题和解决方案

**1. 持续显示 "RX LOSS"**
- **原因：** 无遥测连接
- **解决方案：**
  - 检查接收器已通电并对频
  - 验证接收器上已启用遥测
  - 检查传感器接线
  - 验证 1RSS 传感器正在传输

**2. 没有保存日志**
- **原因：** 飞行时间太短或 SD 卡问题
- **解决方案：**
  - 确保飞行时间超过 30 秒
  - 检查 SD 卡已插入且有可用空间
  - 验证 /LOGS/ 文件夹存在（如缺失会自动创建）
  - 检查 SD 卡未写保护

**3. 日期浏览器中显示 "No logs found!"**
- **原因：** 不存在日志或扫描未完成
- **解决方案：**
  - 首先飞几次以创建日志
  - 等待扫描完成（进度条）
  - 检查 /LOGS/ 文件夹包含日志文件
  - 尝试删除 RFStats.csv 以触发重新扫描

**4. 总飞行次数显示 0**
- **原因：** 统计文件丢失或损坏
- **解决方案：**
  - 删除 /LOGS/RFStats.csv
  - 重启脚本
  - 等待自动重新扫描完成
  - 统计将自动重建

**5. 脚本运行缓慢或卡顿**
- **原因：** 日志文件太多或扫描批次太大
- **解决方案：**
  - 将 SCAN_TOTAL_DAYS 减少到 180 或 90
  - 将 SCAN_LOGS_BATCH_SIZE 减少到 3
  - 将 SCAN_STATS_BATCH_SIZE 减少到 2
  - 将旧日志归档到不同文件夹
  - 考虑 SD 卡速度（使用 Class 10 或更好）

**6. 某些传感器显示错误值**
- **原因：** 传感器名称不匹配
- **解决方案：**
  - 检查 TELEMETRY 菜单中的传感器名称
  - 编辑 teleItemName 数组以匹配您的传感器
  - 验证正在发现传感器 ID（检查脚本第 897-905 行）

**7. 飞行后摘要未出现**
- **原因：** 断开前按了 EXIT 或飞行时间太短
- **解决方案：**
  - 降落前不要按 EXIT/ENTER
  - 确保飞行时长 > 30 秒
  - 检查 closeBoardKey 变量未设置

**8. 日期浏览器显示错误日期**
- **原因：** 遥控器时钟不正确
- **解决方案：**
  - 在遥控器设置中设置正确的日期/时间
  - 现有日志将保留旧日期
  - 新日志将使用正确日期

**9. 内存错误或崩溃**
- **原因：** 一次加载太多日志
- **解决方案：**
  - 将 MAX_LOG_ENTRIES 减少到 50 或 30
  - 删除非常旧的日志
  - 重启遥控器以清除内存

**10. 旧格式中混合机型日志**
- **原因：** 在机型专属文件夹之前创建的日志
- **解决方案：**
  - 使用包含的 reorganize_logs.ps1 脚本
  - 在计算机上，将脚本复制到 SD 卡根目录
  - 运行脚本按机型组织日志
  - 脚本将把日志移动到机型文件夹

---

## FAQ / 常见问题

### English

**Q1: Can I use this script with multiple models?**
A: Yes! The script fully supports multiple models. Each model gets its own folder under /LOGS/, and the total flight counter is tracked separately per model.

**Q2: How much SD card space do logs use?**
A: Each log entry is approximately 100-150 bytes. A typical flight season (200 flights) uses less than 30KB. Statistics file is negligible (<1KB).

**Q3: Can I export logs to analyze on computer?**
A: Yes! Log files are standard CSV format. Open with Excel, LibreOffice, or any text editor. Use the pipe character `|` as delimiter.

**Q4: What happens if I change model names?**
A: The script treats each name as a separate model. If you rename a model, old logs remain under the old name. You can manually move log files between folders if needed.

**Q5: Can I use this with airplanes or multirotors?**
A: Yes, but you may want to customize sensor names and displays. The script is optimized for helicopters but works with any vehicle that provides telemetry.

**Q6: How do I back up my logs?**
A: Connect SD card to computer and copy the entire /LOGS/ folder. To restore, copy it back to the SD card.

**Q7: Can I delete old logs?**
A: Yes. Simply delete old CSV files from the /LOGS/ folder. After deleting, also delete RFStats.csv so statistics recalculate correctly.

**Q8: Does this work with OpenTX Color screens?**
A: No. This script is designed for 128x64 monochrome screens. Color screens require different drawing commands and layout.

**Q9: Why does the script scan for 365 days on first run?**
A: The script builds an index of all available logs for quick date browsing. This only happens once, or when RFStats.csv is missing.

**Q10: Can I run this alongside other telemetry scripts?**
A: This is a full-screen telemetry script. It should be the only script assigned to a screen in the model setup. Don't run multiple telemetry scripts simultaneously.

### 中文

**问1：我可以在多个机型上使用此脚本吗？**
答：可以！脚本完全支持多机型。每个机型在 /LOGS/ 下都有自己的文件夹，总飞行计数器按机型分别跟踪。

**问2：日志使用多少 SD 卡空间？**
答：每个日志条目大约 100-150 字节。典型的飞行季（200 次飞行）使用不到 30KB。统计文件可忽略不计（<1KB）。

**问3：我可以导出日志到计算机分析吗？**
答：可以！日志文件是标准 CSV 格式。用 Excel、LibreOffice 或任何文本编辑器打开。使用管道字符 `|` 作为分隔符。

**问4：如果我更改机型名称会怎样？**
答：脚本将每个名称视为单独的机型。如果您重命名机型，旧日志保留在旧名称下。如需要，您可以手动在文件夹之间移动日志文件。

**问5：我可以在固定翼或多旋翼上使用吗？**
答：可以，但您可能想自定义传感器名称和显示。脚本针对直升机优化，但可用于任何提供遥测的飞行器。

**问6：如何备份我的日志？**
答：将 SD 卡连接到计算机并复制整个 /LOGS/ 文件夹。要恢复，将其复制回 SD 卡。

**问7：我可以删除旧日志吗？**
答：可以。只需从 /LOGS/ 文件夹删除旧的 CSV 文件。删除后，也删除 RFStats.csv 以便统计正确重新计算。

**问8：这在 OpenTX 彩色屏幕上工作吗？**
答：不行。此脚本专为 128x64 单色屏幕设计。彩色屏幕需要不同的绘图命令和布局。

**问9：为什么脚本首次运行时扫描 365 天？**
答：脚本构建所有可用日志的索引以实现快速日期浏览。这只发生一次，或在 RFStats.csv 丢失时。

**问10：我可以与其他遥测脚本一起运行吗？**
答：这是一个全屏遥测脚本。它应该是机型设置中分配给屏幕的唯一脚本。不要同时运行多个遥测脚本。

---

## Additional Tools / 附加工具

### Log Reorganization Script / 日志重组脚本

**Purpose / 目的:**
Converts old format logs (all models in one file) to new format (model-specific folders).

**Usage / 使用方法:**

#### Windows:
1. Copy `reorganize_logs.ps1` and `运行日志重组.bat` to SD card root
2. Ensure SD card has a `/LOGS/` folder with old format logs
3. Double-click `运行日志重组.bat`
4. Wait for completion
5. Original files will be deleted, organized files created in model folders

#### Manual (PowerShell):
```powershell
cd X:\  # Replace X with your SD card drive letter
.\reorganize_logs.ps1
```

**What it does:**
- Reads all `RFLog_*.csv` files from `/LOGS/`
- Groups log entries by model name
- Creates `/LOGS/ModelName/` folders
- Writes separate log files per model
- Deletes original mixed-format files
- Shows statistics of reorganization

---

## Technical Specifications / 技术规格

### English

**Display Requirements:**
- Screen: 128x64 monochrome LCD
- Platform: EdgeTX or OpenTX

**Memory Usage:**
- Base script: ~40KB
- Runtime memory: ~15-30KB (varies with log count)
- Log file size: ~100-150 bytes per entry

**Performance:**
- Background scanning: Batch-based to prevent lag
- File I/O: Optimized buffered reading
- Display refresh: Minimal redraws for efficiency

**Compatibility:**
- EdgeTX: Full support
- OpenTX 2.2+: Full support
- OpenTX 2.1: May work with limitations

**Sensors Required:**
- Minimum: Vbat, 1RSS (for basic operation)
- Recommended: All 10 sensors for full features

### 中文

**显示要求：**
- 屏幕：128x64 单色 LCD
- 平台：EdgeTX 或 OpenTX

**内存使用：**
- 基础脚本：~40KB
- 运行时内存：~15-30KB（随日志数量变化）
- 日志文件大小：每条约 100-150 字节

**性能：**
- 后台扫描：基于批次以防止卡顿
- 文件 I/O：优化的缓冲读取
- 显示刷新：最小化重绘以提高效率

**兼容性：**
- EdgeTX：完全支持
- OpenTX 2.2+：完全支持
- OpenTX 2.1：可能有限支持

**所需传感器：**
- 最低：Vbat、1RSS（用于基本操作）
- 推荐：全部 10 个传感器以获得完整功能

---

## Credits / 致谢

### English

**Script Author:** RFDB  
**Version:** 2.1  
**License:** Open source - Free to use and modify

**Special Thanks:**
- EdgeTX/OpenTX development team
- RC helicopter community for testing and feedback
- All pilots who contributed to feature suggestions

**Support:**
For bug reports, feature requests, or questions, please contact through your RC community forums.

### 中文

**脚本作者：** RFDB  
**版本：** 2.1  
**许可：** 开源 - 可自由使用和修改

**特别感谢：**
- EdgeTX/OpenTX 开发团队
- 遥控直升机社区的测试和反馈
- 所有贡献功能建议的飞手

**支持：**
如需报告错误、请求功能或提问，请通过您的 RC 社区论坛联系。

---

## Changelog / 更新日志

### Version 2.1
- Added multi-model support with separate log folders
- Improved statistics tracking with RFStats.csv
- Enhanced date browser with 365-day scanning
- Optimized memory usage with caching
- Added batch-based background scanning
- Improved CSV parsing performance
- Added total flight counter per model
- Fixed various bugs in log display

### 版本 2.1
- 添加多机型支持，独立日志文件夹
- 改进统计跟踪，使用 RFStats.csv
- 增强日期浏览器，支持 365 天扫描
- 优化内存使用，增加缓存
- 添加基于批次的后台扫描
- 改进 CSV 解析性能
- 添加每机型总飞行计数器
- 修复日志显示中的各种错误

---

## End of Manual / 手册结束

**Thank you for using RF2T!**  
**感谢使用 RF2T！**

**Fly safe and log often!**  
**安全飞行，勤记日志！**

