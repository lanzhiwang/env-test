# 基本信息

## CPU

```bash
############################################################

$ lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                16
On-line CPU(s) list:   0-15
Thread(s) per core:    1
Core(s) per socket:    1
Socket(s):             16
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 85
Model name:            Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
Stepping:              7
CPU MHz:               2992.968
BogoMIPS:              5985.93
Hypervisor vendor:     KVM
Virtualization type:   full
L1d cache:             32K
L1i cache:             32K
L2 cache:              4096K
NUMA node0 CPU(s):     0-15
Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
$

############################################################

$ lscpu | grep Flags: | awk -F: '{print substr($2, 18, length($2)-18)}'
fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilitie
$

############################################################

$ lscpu | grep 'Model name:' | awk -F: '{print substr($2, 13, length($2)-13)}'
Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GH
$

############################################################

$ lscpu | grep 'CPU MHz:' | awk -F: '{print substr($2, 16, length($2)-16)}'
2992.96
$

```

## memory

```bash
############################################################

$ lshw
ccd37fe0a6f1
    description: Computer
    width: 64 bits
    capabilities: smp vsyscall32
  *-core
       description: Motherboard
       physical id: 0
     *-memory
          description: System memory
          physical id: 0
          size: 32GiB
     *-cpu:0
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: 1
          bus info: cpu@0
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:1
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: 2
          bus info: cpu@1
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:2
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: 3
          bus info: cpu@2
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:3
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: 4
          bus info: cpu@3
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:4
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: 5
          bus info: cpu@4
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:5
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: 6
          bus info: cpu@5
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:6
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: 7
          bus info: cpu@6
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:7
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: 8
          bus info: cpu@7
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:8
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: 9
          bus info: cpu@8
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:9
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: a
          bus info: cpu@9
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:10
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: b
          bus info: cpu@10
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:11
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: c
          bus info: cpu@11
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:12
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: d
          bus info: cpu@12
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:13
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: e
          bus info: cpu@13
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:14
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: f
          bus info: cpu@14
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-cpu:15
          product: Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
          vendor: Intel Corp.
          vendor_id: GenuineIntel
          physical id: 10
          bus info: cpu@15
          version: 6.85.7
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp x86-64 constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilities
          configuration: microcode=0
     *-pci
          description: Host bridge
          product: 440FX - 82441FX PMC [Natoma]
          vendor: Intel Corporation
          physical id: 100
          bus info: pci@0000:00:00.0
          version: 02
          width: 32 bits
          clock: 33MHz
        *-isa
             description: ISA bridge
             product: 82371SB PIIX3 ISA [Natoma/Triton II]
             vendor: Intel Corporation
             physical id: 1
             bus info: pci@0000:00:01.0
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: isa
             configuration: latency=0
        *-ide
             description: IDE interface
             product: 82371SB PIIX3 IDE [Natoma/Triton II]
             vendor: Intel Corporation
             physical id: 1.1
             bus info: pci@0000:00:01.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: ide isa_compat_mode bus_master
             configuration: driver=ata_piix latency=0
             resources: irq:0 ioport:1f0(size=8) ioport:3f6 ioport:170(size=8) ioport:376 ioport:c180(size=16)
        *-usb
             description: USB controller
             product: 82371SB PIIX3 USB [Natoma/Triton II]
             vendor: Intel Corporation
             physical id: 1.2
             bus info: pci@0000:00:01.2
             version: 01
             width: 32 bits
             clock: 33MHz
             capabilities: uhci bus_master
             configuration: driver=uhci_hcd latency=0
             resources: irq:11 ioport:c0c0(size=32)
        *-bridge
             description: Bridge
             product: 82371AB/EB/MB PIIX4 ACPI
             vendor: Intel Corporation
             physical id: 1.3
             bus info: pci@0000:00:01.3
             version: 03
             width: 32 bits
             clock: 33MHz
             capabilities: bridge
             configuration: driver=piix4_smbus latency=0
             resources: irq:9
        *-display
             description: VGA compatible controller
             product: QXL paravirtual graphic card
             vendor: Red Hat, Inc.
             physical id: 2
             bus info: pci@0000:00:02.0
             version: 04
             width: 32 bits
             clock: 33MHz
             capabilities: vga_controller rom
             configuration: driver=qxl latency=0
             resources: irq:11 memory:f4000000-f7ffffff memory:f8000000-fbffffff memory:fc050000-fc051fff ioport:c0e0(size=32) memory:fc040000-fc04ffff
        *-network
             description: Ethernet controller
             product: Virtio network device
             vendor: Red Hat, Inc.
             physical id: 3
             bus info: pci@0000:00:03.0
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: bus_master cap_list rom
             configuration: driver=virtio-pci latency=0
             resources: irq:10 ioport:c000(size=64) memory:fc052000-fc052fff memory:fc000000-fc03ffff
           *-virtio0 UNCLAIMED
                description: Virtual I/O device
                physical id: 0
                bus info: virtio@0
                configuration: driver=virtio_net
        *-sata
             description: SATA controller
             product: 82801IR/IO/IH (ICH9R/DO/DH) 6 port SATA Controller [AHCI mode]
             vendor: Intel Corporation
             physical id: 4
             bus info: pci@0000:00:04.0
             version: 02
             width: 32 bits
             clock: 33MHz
             capabilities: sata ahci_1.0 bus_master cap_list
             configuration: driver=ahci latency=0
             resources: irq:39 ioport:c100(size=32) memory:fc053000-fc053fff
        *-communication
             description: Communication controller
             product: Virtio console
             vendor: Red Hat, Inc.
             physical id: 5
             bus info: pci@0000:00:05.0
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: bus_master cap_list
             configuration: driver=virtio-pci latency=0
             resources: irq:10 ioport:c120(size=32) memory:fc054000-fc054fff
           *-virtio1 UNCLAIMED
                description: Virtual I/O device
                physical id: 0
                bus info: virtio@1
                configuration: driver=virtio_console
        *-scsi:0
             description: SCSI storage controller
             product: Virtio block device
             vendor: Red Hat, Inc.
             physical id: 6
             bus info: pci@0000:00:06.0
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: scsi bus_master cap_list
             configuration: driver=virtio-pci latency=0
             resources: irq:11 ioport:c040(size=64) memory:fc055000-fc055fff
           *-virtio2
                description: Virtual I/O device
                physical id: 0
                bus info: virtio@2
                logical name: vda
                configuration: driver=virtio_blk
        *-generic:0
             description: Unclassified device
             product: Virtio memory balloon
             vendor: Red Hat, Inc.
             physical id: 7
             bus info: pci@0000:00:07.0
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: bus_master
             configuration: driver=virtio-pci latency=0
             resources: irq:10 ioport:c140(size=32)
           *-virtio3 UNCLAIMED
                description: Virtual I/O device
                physical id: 0
                bus info: virtio@3
                configuration: driver=virtio_balloon
        *-generic:1
             description: Unclassified device
             product: Virtio RNG
             vendor: Red Hat, Inc.
             physical id: 8
             bus info: pci@0000:00:08.0
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: bus_master
             configuration: driver=virtio-pci latency=0
             resources: irq:11 ioport:c160(size=32)
           *-virtio4 UNCLAIMED
                description: Virtual I/O device
                physical id: 0
                bus info: virtio@4
                configuration: driver=virtio_rng
        *-scsi:1
             description: SCSI storage controller
             product: Virtio block device
             vendor: Red Hat, Inc.
             physical id: 9
             bus info: pci@0000:00:09.0
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: scsi bus_master cap_list
             configuration: driver=virtio-pci latency=0
             resources: irq:10 ioport:c080(size=64) memory:fc056000-fc056fff
           *-virtio5
                description: Virtual I/O device
                physical id: 0
                bus info: virtio@5
                logical name: vdb
                configuration: driver=virtio_blk
     *-pnp00:00
          product: PnP device PNP0b00
          physical id: 11
          capabilities: pnp
          configuration: driver=rtc_cmos
     *-pnp00:01
          product: PnP device PNP0303
          physical id: 12
          capabilities: pnp
          configuration: driver=i8042 kbd
     *-pnp00:02
          product: PnP device PNP0f13
          physical id: 13
          capabilities: pnp
          configuration: driver=i8042 aux
     *-pnp00:03
          product: PnP device PNP0700
          physical id: 14
          capabilities: pnp
     *-pnp00:04
          product: PnP device PNP0501
          physical id: 15
          capabilities: pnp
          configuration: driver=serial
  *-network
       description: Ethernet interface
       physical id: 1
       logical name: eth0
       serial: 02:9a:ee:d8:bc:49
       size: 10Gbit/s
       capabilities: ethernet physical
       configuration: autonegotiation=off broadcast=yes driver=veth driverversion=1.0 duplex=full ip=10.4.0.53 link=yes multicast=yes port=twisted pair speed=10Gbit/s
$
############################################################

$ lshw -short -class memory -quiet
H/W path    Device  Class          Description
==============================================
/0/0                memory         32GiB System memory
$

############################################################

$ lshw -short -class memory -quiet | grep System | awk '{print $3}'
32GiB
$

############################################################

```

## disk

```bash
############################################################

$ lshw -short -class disk -quiet
H/W path    Device  Class          Description
==============================================
/0/100/6/0  vda     disk           Virtual I/O device
/0/100/9/0  vdb     disk           Virtual I/O device
$

############################################################

$ lshw -short -class disk -quiet | grep -v = | grep -v Description
/0/100/6/0  vda     disk           Virtual I/O device
/0/100/9/0  vdb     disk           Virtual I/O device
$

############################################################

```

## network

```bash
############################################################

$ lspci
00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II]
00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)
00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
00:02.0 VGA compatible controller: Red Hat, Inc. QXL paravirtual graphic card (rev 04)
00:03.0 Ethernet controller: Red Hat, Inc. Virtio network device
00:04.0 SATA controller: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 port SATA Controller [AHCI mode] (rev 02)
00:05.0 Communication controller: Red Hat, Inc. Virtio console
00:06.0 SCSI storage controller: Red Hat, Inc. Virtio block device
00:07.0 Unclassified device [00ff]: Red Hat, Inc. Virtio memory balloon
00:08.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG
00:09.0 SCSI storage controller: Red Hat, Inc. Virtio block device
$

############################################################

$ lspci | grep 'Host bridge' | awk -F: '{print $3}' | sed 's/\[//' | sed 's/\]//' | sed 's/(//' | sed 's/)//'
 Intel Corporation 440FX - 82441FX PMC Natoma rev 02
$

############################################################

```

## system

```bash
############################################################

$ uname -a
Linux ccd37fe0a6f1 3.10.0-1160.95.1.el7.x86_64 #1 SMP Mon Jul 24 13:59:37 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
$

############################################################

$ uname -a | awk '{print $1}'
Linux
$

############################################################

$ uname -a | awk '{print $3}'
3.10.0-1160.95.1.el7.x86_64

############################################################

$ uname -a | awk '{print $12}'
x86_64

############################################################

$ uname -a | awk '{print $2}'
ccd37fe0a6f1

############################################################

```

# 性能

## cpu

```bash
############################################################

$ sysbench cpu --cpu-max-prime=10000 run
sysbench 1.0.20 (using bundled LuaJIT 2.1.0-beta2)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Prime numbers limit: 10000

Initializing worker threads...

Threads started!

CPU speed:
    events per second:  1147.31

General statistics:
    total time:                          10.0004s
    total number of events:              11476

Latency (ms):
         min:                                    0.82
         avg:                                    0.87
         max:                                   11.24
         95th percentile:                        1.01
         sum:                                 9984.12

Threads fairness:
    events (avg/stddev):           11476.0000/0.00
    execution time (avg/stddev):   9.9841/0.00

$

############################################################

$ sysbench threads --threads=500 --thread-yields=100 --thread-locks=4 run
sysbench 1.0.20 (using bundled LuaJIT 2.1.0-beta2)

Running the test with following options:
Number of threads: 500
Initializing random number generator from current time


Initializing worker threads...

Threads started!


General statistics:
    total time:                          10.0962s
    total number of events:              59416

Latency (ms):
         min:                                    0.07
         avg:                                   84.57
         max:                                 1045.80
         95th percentile:                      350.33
         sum:                              5024598.59

Threads fairness:
    events (avg/stddev):           118.8320/16.92
    execution time (avg/stddev):   10.0492/0.03

$

############################################################

$ chmod +x /workspace/tools/dhrystone

$ /workspace/tools/dhrystone

Dhrystone Benchmark, Version C, Version 2.2
Program compiled without 'register' attribute
Using times(), HZ=100

Trying 50000 runs through Dhrystone:
Measured time too small to obtain meaningful results

Trying 500000 runs through Dhrystone:
Measured time too small to obtain meaningful results

Trying 5000000 runs through Dhrystone:
Measured time too small to obtain meaningful results

Trying 50000000 runs through Dhrystone:
Final values of the variables used in the benchmark:

Int_Glob:            5
        should be:   5
Bool_Glob:           1
        should be:   1
Ch_1_Glob:           A
        should be:   A
Ch_2_Glob:           B
        should be:   B
Arr_1_Glob[8]:       7
        should be:   7
Arr_2_Glob[8][7]:    55550010
        should be:   Number_Of_Runs + 10
Ptr_Glob->
  Ptr_Comp:          31076368
        should be:   (implementation-dependent)
  Discr:             0
        should be:   0
  Enum_Comp:         2
        should be:   2
  Int_Comp:          17
        should be:   17
  Str_Comp:          DHRYSTONE PROGRAM, SOME STRING
        should be:   DHRYSTONE PROGRAM, SOME STRING
Next_Ptr_Glob->
  Ptr_Comp:          31076368
        should be:   (implementation-dependent), same as above
  Discr:             0
        should be:   0
  Enum_Comp:         1
        should be:   1
  Int_Comp:          18
        should be:   18
  Str_Comp:          DHRYSTONE PROGRAM, SOME STRING
        should be:   DHRYSTONE PROGRAM, SOME STRING
Int_1_Loc:           5
        should be:   5
Int_2_Loc:           13
        should be:   13
Int_3_Loc:           7
        should be:   7
Enum_Loc:            1
        should be:   1
Str_1_Loc:           DHRYSTONE PROGRAM, 1'ST STRING
        should be:   DHRYSTONE PROGRAM, 1'ST STRING
Str_2_Loc:           DHRYSTONE PROGRAM, 2'ND STRING
        should be:   DHRYSTONE PROGRAM, 2'ND STRING

Microseconds for one run through Dhrystone:        0.1
Dhrystones per Second:                         9208103

$

############################################################

```

## memory

```bash
############################################################

$ sysbench memory --memory-block-size=8k --memory-total-size=2G run
sysbench 1.0.20 (using bundled LuaJIT 2.1.0-beta2)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Running memory speed test with the following options:
  block size: 8KiB
  total size: 2048MiB
  operation: write
  scope: global

Initializing worker threads...

Threads started!

Total operations: 262144 (1381121.99 per second)

2048.00 MiB transferred (10790.02 MiB/sec)


General statistics:
    total time:                          0.1879s
    total number of events:              262144

Latency (ms):
         min:                                    0.00
         avg:                                    0.00
         max:                                    6.01
         95th percentile:                        0.00
         sum:                                  151.62

Threads fairness:
    events (avg/stddev):           262144.0000/0.00
    execution time (avg/stddev):   0.1516/0.00

$

############################################################

```

## disk

```bash
############################################################

$ ll /workspace/sbin/disk/data/fiotest
ls: cannot access /workspace/sbin/disk/data/fiotest: No such file or directory
$

############################################################

$ fio -filename=/workspace/sbin/disk/data/fiotest -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -ioengine=psync -bs=4k -size=2G -numjobs=1 -runtime=30 -name=4k_randrw --output-format=json
{
  "fio version" : "fio-3.7",
  "timestamp" : 1708585664,
  "timestamp_ms" : 1708585664802,
  "time" : "Thu Feb 22 07:07:44 2024",
  "global options" : {
    "filename" : "/workspace/sbin/disk/data/fiotest",
    "direct" : "1",
    "iodepth" : "1",
    "rw" : "randrw",
    "rwmixread" : "70",
    "ioengine" : "psync",
    "bs" : "4k",
    "size" : "2G",
    "numjobs" : "1",
    "runtime" : "30"
  },
  "jobs" : [
    {
      "jobname" : "4k_randrw",
      "groupid" : 0,
      "error" : 0,
      "eta" : 0,
      "elapsed" : 31,
      "job options" : {
        "name" : "4k_randrw"
      },
      "read" : {
        "io_bytes" : 482041856,
        "io_kbytes" : 470744,
        "bw_bytes" : 16067526,
        "bw" : 15690,
        "iops" : 3922.735909,
        "runtime" : 30001,
        "total_ios" : 117686,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000
        },
        "clat_ns" : {
          "min" : 40230,
          "max" : 15968599,
          "mean" : 159347.964193,
          "stddev" : 342578.173425,
          "percentile" : {
            "1.000000" : 54528,
            "5.000000" : 61696,
            "10.000000" : 67072,
            "20.000000" : 74240,
            "30.000000" : 80384,
            "40.000000" : 88576,
            "50.000000" : 97792,
            "60.000000" : 110080,
            "70.000000" : 125440,
            "80.000000" : 150528,
            "90.000000" : 203776,
            "95.000000" : 309248,
            "99.000000" : 1449984,
            "99.500000" : 1794048,
            "99.900000" : 3325952,
            "99.950000" : 6979584,
            "99.990000" : 12255232
          }
        },
        "lat_ns" : {
          "min" : 41642,
          "max" : 15971322,
          "mean" : 161340.778665,
          "stddev" : 342734.083544
        },
        "bw_min" : 11097,
        "bw_max" : 19984,
        "bw_agg" : 100.000000,
        "bw_mean" : 15697.915254,
        "bw_dev" : 1775.347361,
        "bw_samples" : 59,
        "iops_min" : 2774,
        "iops_max" : 4996,
        "iops_mean" : 3924.406780,
        "iops_stddev" : 443.867684,
        "iops_samples" : 59
      },
      "write" : {
        "io_bytes" : 205959168,
        "io_kbytes" : 201132,
        "bw_bytes" : 6865076,
        "bw" : 6704,
        "iops" : 1676.044132,
        "runtime" : 30001,
        "total_ios" : 50283,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000
        },
        "clat_ns" : {
          "min" : 58777,
          "max" : 20205263,
          "mean" : 191942.411829,
          "stddev" : 356447.866182,
          "percentile" : {
            "1.000000" : 71168,
            "5.000000" : 79360,
            "10.000000" : 85504,
            "20.000000" : 93696,
            "30.000000" : 102912,
            "40.000000" : 112128,
            "50.000000" : 124416,
            "60.000000" : 140288,
            "70.000000" : 158720,
            "80.000000" : 189440,
            "90.000000" : 252928,
            "95.000000" : 387072,
            "99.000000" : 1515520,
            "99.500000" : 1843200,
            "99.900000" : 3194880,
            "99.950000" : 5734400,
            "99.990000" : 13303808
          }
        },
        "lat_ns" : {
          "min" : 59909,
          "max" : 20209223,
          "mean" : 194045.614184,
          "stddev" : 356586.017875
        },
        "bw_min" : 5061,
        "bw_max" : 8656,
        "bw_agg" : 100.000000,
        "bw_mean" : 6704.033898,
        "bw_dev" : 786.924283,
        "bw_samples" : 59,
        "iops_min" : 1265,
        "iops_max" : 2164,
        "iops_mean" : 1675.915254,
        "iops_stddev" : 196.783645,
        "iops_samples" : 59
      },
      "trim" : {
        "io_bytes" : 0,
        "io_kbytes" : 0,
        "bw_bytes" : 0,
        "bw" : 0,
        "iops" : 0.000000,
        "runtime" : 0,
        "total_ios" : 0,
        "short_ios" : 0,
        "drop_ios" : 0,
        "slat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000
        },
        "clat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000,
          "percentile" : {
            "1.000000" : 0,
            "5.000000" : 0,
            "10.000000" : 0,
            "20.000000" : 0,
            "30.000000" : 0,
            "40.000000" : 0,
            "50.000000" : 0,
            "60.000000" : 0,
            "70.000000" : 0,
            "80.000000" : 0,
            "90.000000" : 0,
            "95.000000" : 0,
            "99.000000" : 0,
            "99.500000" : 0,
            "99.900000" : 0,
            "99.950000" : 0,
            "99.990000" : 0
          }
        },
        "lat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000
        },
        "bw_min" : 0,
        "bw_max" : 0,
        "bw_agg" : 0.000000,
        "bw_mean" : 0.000000,
        "bw_dev" : 0.000000,
        "bw_samples" : 0,
        "iops_min" : 0,
        "iops_max" : 0,
        "iops_mean" : 0.000000,
        "iops_stddev" : 0.000000,
        "iops_samples" : 0
      },
      "sync" : {
        "lat_ns" : {
          "min" : 0,
          "max" : 0,
          "mean" : 0.000000,
          "stddev" : 0.000000,
          "percentile" : {
            "1.000000" : 0,
            "5.000000" : 0,
            "10.000000" : 0,
            "20.000000" : 0,
            "30.000000" : 0,
            "40.000000" : 0,
            "50.000000" : 0,
            "60.000000" : 0,
            "70.000000" : 0,
            "80.000000" : 0,
            "90.000000" : 0,
            "95.000000" : 0,
            "99.000000" : 0,
            "99.500000" : 0,
            "99.900000" : 0,
            "99.950000" : 0,
            "99.990000" : 0
          }
        },
        "total_ios" : 0
      },
      "usr_cpu" : 3.856667,
      "sys_cpu" : 14.113333,
      "ctx" : 169240,
      "majf" : 0,
      "minf" : 7,
      "iodepth_level" : {
        "1" : 100.000000,
        "2" : 0.000000,
        "4" : 0.000000,
        "8" : 0.000000,
        "16" : 0.000000,
        "32" : 0.000000,
        ">=64" : 0.000000
      },
      "latency_ns" : {
        "2" : 0.000000,
        "4" : 0.000000,
        "10" : 0.000000,
        "20" : 0.000000,
        "50" : 0.000000,
        "100" : 0.000000,
        "250" : 0.000000,
        "500" : 0.000000,
        "750" : 0.000000,
        "1000" : 0.000000
      },
      "latency_us" : {
        "2" : 0.000000,
        "4" : 0.000000,
        "10" : 0.000000,
        "20" : 0.000000,
        "50" : 0.119070,
        "100" : 44.419506,
        "250" : 47.699278,
        "500" : 4.016813,
        "750" : 0.579274,
        "1000" : 0.476278
      },
      "latency_ms" : {
        "2" : 2.346266,
        "4" : 0.268502,
        "10" : 0.051200,
        "20" : 0.023219,
        "50" : 0.010000,
        "100" : 0.000000,
        "250" : 0.000000,
        "500" : 0.000000,
        "750" : 0.000000,
        "1000" : 0.000000,
        "2000" : 0.000000,
        ">=2000" : 0.000000
      },
      "latency_depth" : 1,
      "latency_target" : 0,
      "latency_percentile" : 100.000000,
      "latency_window" : 0
    }
  ]
}
$

############################################################

$ mkdir -p /workspace/sbin/disk/data

$ cd /workspace/sbin/disk/data

$ sysbench fileio --threads=16 --file-total-size=2G --file-test-mode=rndrw prepare
sysbench 1.0.20 (using bundled LuaJIT 2.1.0-beta2)

128 files, 16384Kb each, 2048Mb total
Creating files for the test...
Extra file open flags: (none)
Creating file test_file.0
Creating file test_file.1
Creating file test_file.2
Creating file test_file.3
Creating file test_file.4
Creating file test_file.5
Creating file test_file.6
Creating file test_file.7
Creating file test_file.8
Creating file test_file.9
Creating file test_file.10
Creating file test_file.11
Creating file test_file.12
Creating file test_file.13
Creating file test_file.14
Creating file test_file.15
Creating file test_file.16
Creating file test_file.17
Creating file test_file.18
Creating file test_file.19
Creating file test_file.20
Creating file test_file.21
Creating file test_file.22
Creating file test_file.23
Creating file test_file.24
Creating file test_file.25
Creating file test_file.26
Creating file test_file.27
Creating file test_file.28
Creating file test_file.29
Creating file test_file.30
Creating file test_file.31
Creating file test_file.32
Creating file test_file.33
Creating file test_file.34
Creating file test_file.35
Creating file test_file.36
Creating file test_file.37
Creating file test_file.38
Creating file test_file.39
Creating file test_file.40
Creating file test_file.41
Creating file test_file.42
Creating file test_file.43
Creating file test_file.44
Creating file test_file.45
Creating file test_file.46
Creating file test_file.47
Creating file test_file.48
Creating file test_file.49
Creating file test_file.50
Creating file test_file.51
Creating file test_file.52
Creating file test_file.53
Creating file test_file.54
Creating file test_file.55
Creating file test_file.56
Creating file test_file.57
Creating file test_file.58
Creating file test_file.59
Creating file test_file.60
Creating file test_file.61
Creating file test_file.62
Creating file test_file.63
Creating file test_file.64
Creating file test_file.65
Creating file test_file.66
Creating file test_file.67
Creating file test_file.68
Creating file test_file.69
Creating file test_file.70
Creating file test_file.71
Creating file test_file.72
Creating file test_file.73
Creating file test_file.74
Creating file test_file.75
Creating file test_file.76
Creating file test_file.77
Creating file test_file.78
Creating file test_file.79
Creating file test_file.80
Creating file test_file.81
Creating file test_file.82
Creating file test_file.83
Creating file test_file.84
Creating file test_file.85
Creating file test_file.86
Creating file test_file.87
Creating file test_file.88
Creating file test_file.89
Creating file test_file.90
Creating file test_file.91
Creating file test_file.92
Creating file test_file.93
Creating file test_file.94
Creating file test_file.95
Creating file test_file.96
Creating file test_file.97
Creating file test_file.98
Creating file test_file.99
Creating file test_file.100
Creating file test_file.101
Creating file test_file.102
Creating file test_file.103
Creating file test_file.104
Creating file test_file.105
Creating file test_file.106
Creating file test_file.107
Creating file test_file.108
Creating file test_file.109
Creating file test_file.110
Creating file test_file.111
Creating file test_file.112
Creating file test_file.113
Creating file test_file.114
Creating file test_file.115
Creating file test_file.116
Creating file test_file.117
Creating file test_file.118
Creating file test_file.119
Creating file test_file.120
Creating file test_file.121
Creating file test_file.122
Creating file test_file.123
Creating file test_file.124
Creating file test_file.125
Creating file test_file.126
Creating file test_file.127
2147483648 bytes written in 14.13 seconds (144.89 MiB/sec).
$

############################################################

$ sysbench fileio --threads=16 --file-total-size=2G --file-test-mode=rndrw run
sysbench 1.0.20 (using bundled LuaJIT 2.1.0-beta2)

Running the test with following options:
Number of threads: 16
Initializing random number generator from current time


Extra file open flags: (none)
128 files, 16MiB each
2GiB total file size
Block size 16KiB
Number of IO requests: 0
Read/Write ratio for combined random IO test: 1.50
Periodic FSYNC enabled, calling fsync() each 100 requests.
Calling fsync() at the end of test, Enabled.
Using synchronous I/O mode
Doing random r/w test
Initializing worker threads...

Threads started!


File operations:
    reads/s:                      1648.84
    writes/s:                     1099.71
    fsyncs/s:                     3705.27

Throughput:
    read, MiB/s:                  25.76
    written, MiB/s:               17.18

General statistics:
    total time:                          10.4404s
    total number of events:              65342

Latency (ms):
         min:                                    0.00
         avg:                                    2.45
         max:                                  146.40
         95th percentile:                        7.04
         sum:                               159889.11

Threads fairness:
    events (avg/stddev):           4083.8750/179.39
    execution time (avg/stddev):   9.9931/0.00

$

############################################################

$ sysbench fileio --threads=16 --file-total-size=2G --file-test-mode=rndrw cleanup
sysbench 1.0.20 (using bundled LuaJIT 2.1.0-beta2)

Removing test files...
$

$ rm /workspace/sbin/disk/disk_throughput_info.data
rm: cannot remove ‘/workspace/sbin/disk/disk_throughput_info.data’: No such file or directory
$

############################################################

```

## network

### iperf 服务端

```bash
############################################################

$ docker run -it --rm --name env-test-server \
--net=my-network-test \
-p 3389:3389 \
registry.alauda.cn:60080/middleware/env-test:v0.0.0-fix.7.3.g53eca1e4-learn-2a6283d8-20231106 bash

############################################################

$ iperf3 -s -i 1 -p 3389 -B 0.0.0.0

```

### iperf 客户端

```bash
############################################################

$ nerdctl inspect env-test-server | grep IPAddress
            "IPAddress": "10.4.2.10",
                    "IPAddress": "10.4.2.10",
$

############################################################

$ docker run -ti --rm --name env-test \
--net=my-network-test \
registry.alauda.cn:60080/middleware/env-test:v0.0.0-fix.7.3.g53eca1e4-learn-2a6283d8-20231106 bash

############################################################

$ iperf3 -c 10.4.2.10 -p 3389 -i 1
Connecting to host 10.4.2.10, port 3389
[  5] local 10.4.2.11 port 59450 connected to 10.4.2.10 port 3389
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  2.99 GBytes  25.7 Gbits/sec  181    792 KBytes
[  5]   1.00-2.00   sec  2.51 GBytes  21.5 Gbits/sec  226    981 KBytes
[  5]   2.00-3.00   sec  2.27 GBytes  19.5 Gbits/sec  726    802 KBytes
[  5]   3.00-4.00   sec  2.25 GBytes  19.3 Gbits/sec  738    699 KBytes
[  5]   4.00-5.00   sec  2.46 GBytes  21.1 Gbits/sec  1085    452 KBytes
[  5]   5.00-6.00   sec  2.61 GBytes  22.4 Gbits/sec  719    451 KBytes
[  5]   6.00-7.00   sec  2.73 GBytes  23.5 Gbits/sec  286    325 KBytes
[  5]   7.00-8.00   sec  2.94 GBytes  25.2 Gbits/sec  154    515 KBytes
[  5]   8.00-9.00   sec  2.99 GBytes  25.7 Gbits/sec  415    560 KBytes
[  5]   9.00-10.00  sec  2.78 GBytes  23.8 Gbits/sec  335    535 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  26.5 GBytes  22.8 Gbits/sec  4865             sender
[  5]   0.00-10.00  sec  26.5 GBytes  22.8 Gbits/sec                  receiver

iperf Done.
$

############################################################

$ iperf3 -u -c 10.4.2.10 -p 3389 -b 1500M -i 1
Connecting to host 10.4.2.10, port 3389
[  5] local 10.4.2.11 port 59605 connected to 10.4.2.10 port 3389
[ ID] Interval           Transfer     Bitrate         Total Datagrams
[  5]   0.00-1.00   sec  98.4 MBytes   825 Mbits/sec  71226
[  5]   1.00-2.00   sec  99.2 MBytes   832 Mbits/sec  71853
[  5]   2.00-3.00   sec  90.5 MBytes   759 Mbits/sec  65549
[  5]   3.00-4.00   sec  87.6 MBytes   735 Mbits/sec  63450
[  5]   4.00-5.00   sec  97.1 MBytes   815 Mbits/sec  70317
[  5]   5.00-6.00   sec  98.7 MBytes   828 Mbits/sec  71450
[  5]   6.00-7.00   sec  98.8 MBytes   828 Mbits/sec  71514
[  5]   7.00-8.00   sec   100 MBytes   840 Mbits/sec  72498
[  5]   8.00-9.00   sec  99.2 MBytes   832 Mbits/sec  71811
[  5]   9.00-10.00  sec  98.6 MBytes   827 Mbits/sec  71431
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-10.00  sec   968 MBytes   812 Mbits/sec  0.000 ms  0/701099 (0%)  sender
[  5]   0.00-10.00  sec   925 MBytes   776 Mbits/sec  0.050 ms  30980/700842 (4.4%)  receiver

iperf Done.
$

############################################################

```


