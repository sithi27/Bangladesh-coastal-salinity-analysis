import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
import warnings
warnings.filterwarnings("ignore")

print("=" * 60)
print("  Bangladesh Coastal Salinity Analysis")
print("  Source: FAO Report AC352E, Tables XIV, XV, XVIII")
print("  Districts: Khulna, Bagerhat, Satkhira (1976-1980)")
print("=" * 60)

# ─────────────────────────────────────────
# 1. LOAD DATA
# ─────────────────────────────────────────
df = pd.read_csv("salinity_measurements.csv", 
                 on_bad_lines="skip")

# Month columns
months = ["Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","Jan","Feb","Mar"]
for m in months:
    df[m] = pd.to_numeric(df[m], errors="coerce")

print(f"\nTotal records loaded : {len(df)}")
print(f"Districts            : {df['District'].unique()}")
print(f"Years                : {df['Year'].unique()}")
print(f"Stages               : {df['Stage'].unique()}")
print(f"Items                : {df['Item'].unique()}")
print(f"\nNull value check:\n{df[months].isnull().sum()}")

# ─────────────────────────────────────────
# 2. MEAN SALINITY BY DISTRICT (overall)
# ─────────────────────────────────────────
mean_only = df[df["Item"] == "Mean"]
district_mean = mean_only.groupby("District")[months].mean()

print("\n─── Mean Salinity by District (E.C. M/Mhos) ───")
print(district_mean.round(0))

# ─────────────────────────────────────────
# 3. SEASONAL PATTERN — which months highest?
# ─────────────────────────────────────────
overall_monthly = mean_only[months].mean()
peak_month = overall_monthly.idxmax()
low_month  = overall_monthly.idxmin()
print(f"\nPeak salinity month  : {peak_month} ({overall_monthly[peak_month]:.0f} M/Mhos)")
print(f"Lowest salinity month: {low_month}  ({overall_monthly[low_month]:.0f} M/Mhos)")

# ─────────────────────────────────────────
# 4. HWS vs LWS comparison
# ─────────────────────────────────────────
hws = df[df["Stage"] == "HWS"][months].mean()
lws = df[df["Stage"] == "LWS"][months].mean()
print(f"\nAvg HWS salinity: {hws.mean():.0f} M/Mhos")
print(f"Avg LWS salinity: {lws.mean():.0f} M/Mhos")

# ─────────────────────────────────────────
# 5. PLOTS
# ─────────────────────────────────────────
colors = {"Khulna": "#2471A3", "Bagerhat": "#1A8A5A", "Satkhira": "#C0392B"}
fig, axes = plt.subplots(2, 2, figsize=(16, 12))
fig.suptitle("Bangladesh Coastal Salinity Analysis (1976–1980)\nSource: FAO Report AC352E",
             fontsize=15, fontweight="bold", y=1.01)

# ── Plot 1: Seasonal pattern by district ──
ax1 = axes[0, 0]
for district in ["Khulna", "Bagerhat", "Satkhira"]:
    data = mean_only[mean_only["District"] == district][months].mean()
    ax1.plot(months, data, marker="o", label=district,
             color=colors[district], linewidth=2.5, markersize=6)
ax1.set_title("Seasonal Salinity Pattern by District (Mean)", fontweight="bold")
ax1.set_xlabel("Month")
ax1.set_ylabel("E.C. (M/Mhos)")
ax1.legend()
ax1.grid(True, alpha=0.3)
ax1.tick_params(axis="x", rotation=45)

# ── Plot 2: HWS vs LWS ──
ax2 = axes[0, 1]
ax2.plot(months, hws.values, marker="s", color="#E74C3C",
         label="HWS (High Water Slack)", linewidth=2.5)
ax2.plot(months, lws.values, marker="^", color="#3498DB",
         label="LWS (Low Water Slack)", linewidth=2.5)
ax2.set_title("HWS vs LWS Salinity Comparison", fontweight="bold")
ax2.set_xlabel("Month")
ax2.set_ylabel("E.C. (M/Mhos)")
ax2.legend()
ax2.grid(True, alpha=0.3)
ax2.tick_params(axis="x", rotation=45)

# ── Plot 3: Year-wise mean salinity by district ──
ax3 = axes[1, 0]
year_district = mean_only.groupby(["Year", "District"])[months].mean().mean(axis=1).reset_index()
year_district.columns = ["Year", "District", "Mean_EC"]
for district in ["Khulna", "Bagerhat", "Satkhira"]:
    d = year_district[year_district["District"] == district]
    ax3.plot(d["Year"], d["Mean_EC"], marker="o", label=district,
             color=colors[district], linewidth=2.5, markersize=8)
ax3.set_title("Year-wise Mean Salinity by District", fontweight="bold")
ax3.set_xlabel("Year")
ax3.set_ylabel("Annual Mean E.C. (M/Mhos)")
ax3.legend()
ax3.grid(True, alpha=0.3)
ax3.tick_params(axis="x", rotation=30)

# ── Plot 4: Max salinity bar chart by district ──
ax4 = axes[1, 1]
max_only = df[df["Item"] == "Max"]
district_max = max_only.groupby("District")[months].max().max(axis=1)
bars = ax4.bar(district_max.index, district_max.values,
               color=[colors[d] for d in district_max.index],
               edgecolor="white", width=0.5)
for bar, val in zip(bars, district_max.values):
    ax4.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 200,
             f"{int(val):,}", ha="center", va="bottom", fontweight="bold", fontsize=11)
ax4.set_title("Peak (Maximum) Salinity Ever Recorded by District", fontweight="bold")
ax4.set_xlabel("District")
ax4.set_ylabel("Max E.C. (M/Mhos)")
ax4.grid(True, alpha=0.3, axis="y")

plt.tight_layout()
plt.savefig("salinity_analysis.png", dpi=150, bbox_inches="tight")
plt.show()
print("\nChart saved as salinity_analysis.png")

# ─────────────────────────────────────────
# 6. KEY FINDINGS SUMMARY
# ─────────────────────────────────────────
print("\n" + "=" * 60)
print("  KEY FINDINGS")
print("=" * 60)
for district in ["Khulna", "Bagerhat", "Satkhira"]:
    d = mean_only[mean_only["District"] == district][months].mean()
    peak = d.idxmax()
    low  = d.idxmin()
    print(f"\n{district}:")
    print(f"  Peak month  : {peak} ({d[peak]:.0f} M/Mhos)")
    print(f"  Lowest month: {low} ({d[low]:.0f} M/Mhos)")
    print(f"  Annual mean : {d.mean():.0f} M/Mhos")
