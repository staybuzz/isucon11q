alter table isu_condition add index timestamp_idx(timestamp);
alter table isu_condition add index uuid_timestamp_idx(jia_isu_uuid, timestamp);