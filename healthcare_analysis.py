import pandas as pd

df = pd.read_csv(
    r"C:\Users\TANVI KISHOR KOTIAN\Downloads\healthcare_dataset.csv\healthcare_dataset.csv"
)

print("Dataset Loaded Successfully!\n")

# Dataset Overview
print("Dataset Shape:")
print(df.shape)

print("\nColumn Names:")
print(df.columns)

print("\nDataset Information:")
print(df.info())

# Missing Values
print("\nMissing Values:")
print(df.isnull().sum())

# Duplicate Records
print("\nDuplicate Records:")
print(df.duplicated().sum())

# Remove Duplicates
df.drop_duplicates(inplace=True)

# Convert Date Columns
df["Date of Admission"] = pd.to_datetime(df["Date of Admission"])
df["Discharge Date"] = pd.to_datetime(df["Discharge Date"])

# Create Length of Stay
df["Length_of_Stay"] = (
    df["Discharge Date"] - df["Date of Admission"]
).dt.days

print("\nAverage Length of Stay:")
print(round(df["Length_of_Stay"].mean(), 2))

# Create Age Groups
bins = [0, 18, 35, 50, 65, 100]

labels = [
    "Child",
    "Young Adult",
    "Adult",
    "Senior Adult",
    "Senior Citizen"
]

df["Age_Group"] = pd.cut(
    df["Age"],
    bins=bins,
    labels=labels
)

# Top Medical Conditions
print("\nTop Medical Conditions:")
print(
    df["Medical Condition"]
    .value_counts()
    .head(10)
)

# Gender Distribution
print("\nGender Distribution:")
print(
    df["Gender"]
    .value_counts()
)

# Admission Type Distribution
print("\nAdmission Type Distribution:")
print(
    df["Admission Type"]
    .value_counts()
)

# Top Hospitals by Revenue
print("\nTop Hospitals by Revenue:")
print(
    df.groupby("Hospital")["Billing Amount"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)

# Average Billing by Medical Condition
print("\nAverage Billing by Medical Condition:")
print(
    df.groupby("Medical Condition")["Billing Amount"]
    .mean()
    .sort_values(ascending=False)
)

# Save Cleaned Dataset
df.to_csv(
    "healthcare_cleaned.csv",
    index=False
)

print("\nCleaned dataset saved successfully!")