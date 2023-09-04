import csv
import os
import time

import pandas as pd
class EnvLogStatistic:
    log_dir= "log"
    device_files=["system_base.log","cpu_device.log","disk_device.log","mem_device.log","network_device.log"]
    calculate_items=[
        {"file": "cpu_test.csv","title":"CPU性能测试"},
        {"file": "disk_test.csv","title":"磁盘性能测试"},
        {"file": "mem_test.csv","title":"内存性能测试"},
        {"file": "network_test.csv","title":"网络性能测试"},
    ]
    calculate_rules={
        "计算10000以内最大素数耗时":{
            "unit":"s",
        },
        "调度500个线程耗时":{
            "unit":"s",
        },
        "每秒读写速度":{
            "unit":" MiB/sec",
        },
        "4k数据块随机读95%延迟":{
            "unit": "us",
        },
        "4k数据块随机写95%延迟":{
            "unit": "us",
        },
        "4k数据块随机读最大延迟":{
            "unit": "us",
        },
        "4k数据块随机写最大延迟":{
            "unit": "us",
        },
        "TCP发送带宽":{
            "unit":" Gbits/sec",
        },
        "UDP带宽":{
            "unit":" Mbits/sec",
        },
        "UDP延迟":{
            "unit":"ms",
        },
        "UDP丢包率":{
            "func":lambda x:(x.split(")")[0].split("(")[1]),
            "unit":"%",
        },
    }
    def __call__(self):
        self.run()
    def run(self):
        for device_file in self.device_files:
            device_path=os.path.join(self.log_dir,device_file)
            self.device_info(device_path)
        for calculate_item in self.calculate_items:
            self.calculate_info(calculate_item)
    def device_info(self,path:str):
        with open(path)as f:
            print(f.read())

    def calculate_info(self,calculate_item:dict):
        print(f"########{calculate_item['title']}#########")
        df=pd.read_csv(os.path.join(self.log_dir,calculate_item["file"]))
        df=df.dropna()
        for col in df.columns:
            if col in self.calculate_rules and df[col].dtype!="float64":
                if "func" in self.calculate_rules[col]:
                    df[col]=df[col].apply(self.calculate_rules[col]["func"])
                if  "unit" in self.calculate_rules[col]:
                    df[col]=df[col].apply(lambda x: float(x.split(self.unit(col))[0]))
                    print(f"{col}:\t{round(df[col].mean(),2)}{self.unit(col)}")
                else:
                    print(f"{col}:\t{round(df[col].mean(),2)}")
            elif df[col].dtype=="float64":
                print(f"{col}:\t{round(df[col].mean(),2)}")
            else:
                print(f"{col}:\t{df[col].mode()[0]}")
        print()

    def unit(self,col:str):
        return self.calculate_rules[col]["unit"]


if __name__ == '__main__':
    interval = 60
    if os.getenv("INTERVAL") is not None:
        interval = int(os.getenv("INTERVAL"))
    print(f"interval:{interval}")
    s = EnvLogStatistic()
    while True:
        time.sleep(interval)
        s()
