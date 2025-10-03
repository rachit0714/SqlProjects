# 🐼 SQL ↔ pandas Cheat Sheet

A quick reference guide for translating common SQL queries into pandas DataFrame operations.

---

## 1. SELECT
**SQL**
```sql
SELECT column1, column2 FROM table;
````

**pandas**

```python
df[["column1", "column2"]]
```

---

## 2. WHERE

**SQL**

```sql
SELECT * FROM table WHERE column1 > 10;
```

**pandas**

```python
df[df["column1"] > 10]
```

---

## 3. AND / OR

**SQL**

```sql
SELECT * FROM table WHERE column1 > 10 AND column2 = 'X';
```

**pandas**

```python
df[(df["column1"] > 10) & (df["column2"] == "X")]
```

---

## 4. ORDER BY

**SQL**

```sql
SELECT * FROM table ORDER BY column1 DESC;
```

**pandas**

```python
df.sort_values(by="column1", ascending=False)
```

---

## 5. LIMIT

**SQL**

```sql
SELECT * FROM table LIMIT 5;
```

**pandas**

```python
df.head(5)
```

---

## 6. COUNT / AVG / SUM / MIN / MAX

**SQL**

```sql
SELECT COUNT(*), AVG(column1), SUM(column2), MIN(column3), MAX(column3)
FROM table;
```

**pandas**

```python
len(df)
df["column1"].mean()
df["column2"].sum()
df["column3"].min()
df["column3"].max()
```

---

## 7. GROUP BY

**SQL**

```sql
SELECT column1, AVG(column2) FROM table GROUP BY column1;
```

**pandas**

```python
df.groupby("column1")["column2"].mean()
```

---

## 8. HAVING

**SQL**

```sql
SELECT column1, AVG(column2)
FROM table
GROUP BY column1
HAVING AVG(column2) > 100;
```

**pandas**

```python
df.groupby("column1")["column2"].mean().reset_index().query("column2 > 100")
```

---

## 9. DISTINCT

**SQL**

```sql
SELECT DISTINCT column1 FROM table;
```

**pandas**

```python
df["column1"].unique()
df.drop_duplicates(subset=["column1"])
```

---

## 10. JOIN

**SQL**

```sql
SELECT * FROM table1
JOIN table2 ON table1.id = table2.id;
```

**pandas**

```python
pd.merge(df1, df2, on="id", how="inner")
```

---

## 11. UNION

**SQL**

```sql
SELECT * FROM table1
UNION
SELECT * FROM table2;
```

**pandas**

```python
pd.concat([df1, df2]).drop_duplicates()
```

---

## 12. UPDATE

**SQL**

```sql
UPDATE table
SET column1 = column1 + 10
WHERE column2 = 'X';
```

**pandas**

```python
df.loc[df["column2"] == "X", "column1"] += 10
```

---

## 13. DELETE

**SQL**

```sql
DELETE FROM table WHERE column1 < 0;
```

**pandas**

```python
df = df[df["column1"] >= 0]
```

---

# ✅ Summary

* **WHERE → filters rows**
* **GROUP BY + HAVING → groupby() + query()**
* **JOIN → merge()**
* **UNION → concat()**
* **UPDATE/DELETE → loc[] or filtering**

```

